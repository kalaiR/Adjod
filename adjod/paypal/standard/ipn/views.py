#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.http import HttpResponse, HttpResponseRedirect
from django.views.decorators.http import require_POST
from django.views.decorators.csrf import csrf_exempt
from paypal.standard.ipn.forms import PayPalIPNForm
from paypal.standard.ipn.models import PayPalIPN
from adjod.views import show_me_the_money
from adjod.models import *
 
@csrf_exempt 
# @require_POST
def ipn(request, item_check_callable=None):
    print "enter ipn"
    """
    PayPal IPN endpoint (notify_url).
    Used by both PayPal Payments Pro and Payments Standard to confirm transactions.
    http://tinyurl.com/d9vu9d
    
    PayPal IPN Simulator:
    https://developer.paypal.com/cgi-bin/devscr?cmd=_ipn-link-session
    """
    flag = None
    ipn_obj = None
    
    # Clean up the data as PayPal sends some weird values such as "N/A"
    data = request.POST.copy()
    date_fields = ('time_created', 'payment_date', 'next_payment_date', 'subscr_date', 'subscr_effective')
    for date_field in date_fields:
        if data.get(date_field) == 'N/A':
            del data[date_field]

    form = PayPalIPNForm(data)
    if form.is_valid():
        try:
            ipn_obj = form.save(commit=False)
        except Exception, e:
            flag = "Exception while processing. (%s)" % e
    else:
        flag = "Invalid form. (%s)" % form.errors
 
    if ipn_obj is None:
        ipn_obj = PayPalIPN()

    ipn_obj.initialize(request)
    if flag is not None:
        ipn_obj.set_flag(flag)
    else:
        # Secrets should only be used over SSL.
        if request.is_secure() and 'secret' in request.GET:
            ipn_obj.verify_secret(form, request.GET['secret'])
        else:
            try:
                print "try"
                ipn_obj.verify(item_check_callable)
                print "ipn_obj", ipn_obj
            except:
                print "except"
                import sys, traceback
                traceback.print_exc(file=sys.stdout)
    user_id=UserProfile.objects.get(user=request.user.id)
    ipn_obj.userprofile=user_id
    print "user_id saved", 
    ipn_obj.save()
    s_m_t_m=show_me_the_money(request, item_check_callable=None)
    return HttpResponseRedirect("/postad/")