#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.http import HttpResponse
from django.views.decorators.http import require_POST
from paypal.standard.ipn.forms import PayPalIPNForm
from paypal.standard.ipn.models import PayPalIPN
from django.views.decorators.csrf import csrf_protect, csrf_exempt
from paypal.standard.models import ST_PP_COMPLETED
from paypal.standard.ipn.signals import payment_was_successful
from adjod.models import UserProfile

from django.contrib.sites.models import Site
from advertisement.models import PremiumPriceInfo
from adjod.util import currency_of_country
from django.conf import settings
from django.template import RequestContext
from django.shortcuts import render_to_response, render
from django.db import transaction

def show_me_the_money(sender, **kwargs):
	print "show_me_the_money"
	ipn_obj = sender
	if ipn_obj.payment_status == ST_PP_COMPLETED:
		# Undertake some action depending upon `ipn_obj`.
		if ipn_obj.custom == "Upgrade all users!":
			Users.objects.update(paid=True)
payment_was_successful.connect(show_me_the_money)

@transaction.commit_on_success
@csrf_exempt
@require_POST
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
			ipn_obj.verify(item_check_callable)
	ipn_obj.user =  UserProfile.objects.get(id=request.user.id)
	
	if ipn_obj.payment_status == "Pending":
		print "pending"
		transaction.rollback()
	else:
		order = Order()

	ipn_obj.save()

	return HttpResponse("OKAY")

def paypal_transaction(request, product_dict):
    current_site = Site.objects.get_current()
    print "product_dict", product_dict
    plan = PremiumPriceInfo.objects.get(id=product_dict['premium_plan'])
    ctx = { 'business': settings.PAYPAL_RECEIVER_EMAIL,
    		'amount': plan.premium_price,
    		'item_name': product_dict['title'],
    		'notify_url': current_site.domain + settings.PAYPAL_DICT['notify_url'],
    		'cancel_return': current_site.domain + settings.PAYPAL_DICT['cancel_return'],
    		'return': current_site.domain + settings.PAYPAL_DICT['success_return'],
    		'custom':product_dict['you_name'],
    		# 'currency_code': plan.base_currency,
    		'currency_code': "USD",
    		'sandbox_url':settings.SANDBOX_URL
    }
    return render_to_response('paypal_integration/payment.html', ctx , context_instance=RequestContext(request))
  