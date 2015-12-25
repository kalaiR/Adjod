#User verification and token generation when user login
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout
from django.core.context_processors import csrf
from django.views.decorators.csrf import csrf_protect, csrf_exempt
from django.contrib.auth import authenticate, login
from django.contrib.auth.tokens import default_token_generator

#Different ways of rendering HTML page
from django.shortcuts import render_to_response, render, redirect
from django.template import RequestContext
from django.http import HttpResponseRedirect, HttpResponse

#For text conversion
from django.utils.translation import ugettext_lazy as _
from django.utils.translation import ugettext, string_concat
from django.core.urlresolvers import reverse

#calling local apps such as models, forms, etc..
from django import forms
from advertisement.models import *
from banner.models import *
from templated_email import send_templated_mail
from adjod.util import *

#Others
import logging
import random
import string
from urllib import unquote, urlencode, unquote_plus
from django.conf import settings
from django.utils.encoding import smart_unicode, force_unicode
from time import time

#Generate JSON documents
from django.utils import simplejson
import simplejson as json

#Paypal transaction
from paypal.standard.forms import PayPalPaymentsForm
from paypal.standard.ipn.signals import payment_was_successful

# from django.contrib.sites.models import get_current_site
from adjod.util import format_redirect_url
from django.core.exceptions import ValidationError
from django.contrib import messages

#for currency conversion
from djmoney_rates.models import Rate
from adjod.models import BaseCurrency, ExchangeRate

# For Chat
from chat.models import *

#Paypal transaction definition
@csrf_exempt
def show_me_the_money(sender, **kwargs):
    # print "show_me_the_money"
    ipn_obj = sender
    payStatus=ipn_obj.POST.get('payment_status','')
    if payStatus=='Completed':
        print "show_me_the_money1"
    # Undertake some action depending upon `ipn_obj`.
    # if ipn_obj.custom == "Upgrade all users!":
    #     User.objects.update(paid=True)
# print "show_me_the_money2"
payment_was_successful.connect(show_me_the_money)

def notify(request):
    # print "notify"
    # print "request", request.REQUEST['business']
    return HttpResponseRedirect("/")

@csrf_exempt
def view_that_asks_for_money(request):
    # userprofile = UserProfile.objects.get(user_id=request.user.id)
    # if 'transaction=success' in request.REQUEST:
    #     userprofile.is_subscribed=True
    # elif 'transaction=error' in request.REQUEST:
    #     userprofile.is_subscribed=False

    # What you want the button to do.
    # paypal_dict = {
    #     # "business": settings.PAYPAL_RECEIVER_EMAIL,
    #     # "amount": "10.00",
    #     # "item_name": "Advertisement Merchant",
    #     # "invoice": "unique-invoice-id",
    #     # "notify_url": 'http://192.168.1.35:8000/show_me_the_money',
    #     # "return_url": "http://192.168.1.35:8000/",
    #     "cancel_return": "http://192.168.1.35:8000/?transactionfail=error",
    #     # "notify_url": 'http://46.4.81.207:9000/show_me_the_money',
    #     # "return_url": "http://46.4.81.207:9000/",
    #     # "cancel_return": "http://46.4.81.207:9000/?transactionfail=error",
    # }

    # form = PayPalPaymentsForm(initial=paypal_dict)
    # context = {"form": form}
    # return render(request, "payment.html", context)
    return render_to_response("paypal_integration/payment.html", context_instance=RequestContext(request))


#Home page defintion
@csrf_exempt
def home(request):
    if request.user.is_superuser:
        logout(request)
        return HttpResponseRedirect('/')
    return render_to_response('adjod/userpage.html', context_instance=RequestContext(request))


@csrf_protect
def user_login(request):
    if request.method == 'POST':
        error={}
        username = request.POST['email_id']
        password = request.POST['password']
        if 'search' in request.POST['next']:
            next_url = request.POST['next'].split('&')[0]
        else:
            next_url = request.POST['next'].split('?')[0]
        print "next_url", next_url
        try:
            
            if '@' in username:
                if not User.objects.filter(email=username).exists():
                    error['email_exists'] = ugettext('Email Doesnot exists')
                    print "error['email_exists']",error['email_exists']
                    raise ValidationError(error['email_exists'], 1)
            else:
                if not User.objects.filter(username=username).exists():
                    error['username_exists'] = ugettext('Username Does not exists')
                    print "error['username_exists']",error['username_exists']
                    raise ValidationError(error['username_exists'], 2)
        except ValidationError as e:
            messages.add_message(request, messages.ERROR, e.messages[-1])
            if next_url == '/':
                redirect_path = "/login/"
            else:
                redirect_path = next_url
            query_string = 'si=%d' % e.code
            redirect_url = format_redirect_url(redirect_path, query_string)
            return HttpResponseRedirect(redirect_url)
        if not error:
            if not '@' in username:
                user = User.objects.get(username=username)
            else:
                user = User.objects.get(email=username)
            user.backend='django.contrib.auth.backends.ModelBackend'
            try:
                if user.check_password(password):
                    print user
                else:
                    error['password'] = ugettext('Wrong password')
                    raise ValidationError(error['password'], 3)
            except ValidationError as e:
                messages.add_message(request, messages.ERROR, e.messages[-1])
                if next_url == '/':
                    redirect_path = "/login/"
                else:
                    redirect_path = next_url
                query_string = 'si=%d' % e.code
                redirect_url = format_redirect_url(redirect_path, query_string)
                return HttpResponseRedirect(redirect_url)
            if user:
                # Is the account active? It could have been disabled.
                if user.is_active:
                    # If the account is valid and active, we can log the user in.
                    # We'll send the user back to the homepage.
                    login(request, user)
                    print user.id
                    user_id=user.id
                    # starturl=reverse('start',kwargs={ 'user_id': user.id })
                    if next_url == '/':
                        response=HttpResponseRedirect('/start/?user_id=' + str(user.id))
                    else:
                        response=HttpResponseRedirect(next_url)
                    response.set_cookie("chat_email", user.email)
                    response.set_cookie("chat_user", user.username)
                    response.set_cookie("chat_userid", user_id)
                    return response
                else:
                    # An inactive account was used - no logging in!
                    try:
                        error['inactive'] = ugettext('Your Account is already inactive due to non-maintanence')
                        raise ValidationError(error['inactive'], 4)
                    except ValidationError as e:
			            messages.add_message(request, messages.ERROR, e.messages[-1])
			            if next_url == '/':
			                redirect_path = "/login/"
			            else:
			                redirect_path = next_url
			            query_string = 'si=%d' % e.code
			            redirect_url = format_redirect_url(redirect_path, query_string)
			            return HttpResponseRedirect(redirect_url)
    else:
      return render_to_response('adjod/userpage.html', context_instance=RequestContext(request))


def auto_login(request, user):
    user.backend = 'django.contrib.auth.backends.ModelBackend'
    login(request, user)
    request.session.set_expiry(12 * 30 * 24 * 60 * 60)


#User registration definition
@csrf_protect
def register(request):
    if request.method == 'POST' and request.user.is_anonymous():
        error={}
        email=request.POST['email_id']
        username=request.POST['user_id']        
        try:   
            if User.objects.filter(email=email).exists():
                error['email_exists'] = ugettext('Email already exists')
                print "error['email_exists']",error['email_exists']
                raise ValidationError(error['email_exists'], 1)
            if User.objects.filter(username=username).exists():
                error['username_exists'] = ugettext('Username already exists')
                print "error['username_exists']",error['username_exists']
                raise ValidationError(error['username_exists'], 2)
        except ValidationError as e:
            messages.add_message(request, messages.ERROR, e.messages[-1])
            redirect_path = "/"
            query_string = 'st=%d' % e.code
            redirect_url = format_redirect_url(redirect_path, query_string)
            return HttpResponseRedirect(redirect_url)     
        if not error:
            userprofile = UserProfile()
            userprofile.is_active = True
            userprofile.username=request.POST['user_id']
            userprofile.email=request.POST['email_id']
            userprofile.password=request.POST['password']
            userprofile.set_password(userprofile.password)
            userprofile.first_name=request.POST['user_id']
            userprofile.mobile=request.POST['your_mobile_number']
            try: 
                userprofile.city=City.objects.get(city=request.COOKIES.get('city'))
            except:
                userprofile.city=None
            try: 
                userprofile.language=request.COOKIES.get('adjod_language')
            except:
                userprofile.language=None
            try: 
                userprofile.country_code=request.COOKIES.get('country_code')
            except:
                userprofile.country_code=None   
            userprofile.age_status=request.POST.get('confirm')
            userprofile.confirmation_code = ''.join(random.choice(string.ascii_uppercase + string.digits + string.ascii_lowercase) for x in range(33))      
            userprofile.save()           
            send_registration_confirmation(userprofile)
            auto_login(request, userprofile)
            return HttpResponseRedirect('/start/?user_id=' + str(userprofile.id))


def send_registration_confirmation(userprofile):
    title = "Resell account confirmation"
    content = "http://" + settings.SITE_NAME + "/confirm/" + str(userprofile.confirmation_code) + "/" + userprofile.username
    send_templated_mail(
                template_name = 'welcome',
                subject = 'Welcome to Resell.com',
                from_email = 'testmail123sample@gmail.com',
                recipient_list = [userprofile.email],
                context={
                         'user': userprofile,
                         'content':content,
                },
            )


def confirm(request, confirmation_code, username):
    try:
        userprofile = UserProfile.objects.get(username=username)
        if userprofile.confirmation_code == confirmation_code:
            userprofile.is_emailverified=True
            userprofile.save()
            auto_login(request, userprofile)
        return HttpResponseRedirect('/start/?user_id=' + str(userprofile.id))
    except:
        return HttpResponseRedirect('/')


def start(request):    
    try:
        last_active = LastActive.objects.create(user = UserProfile.objects.get(id=request.user.id), session = Session.objects.get(session_key = request.session.session_key))
        last_active.save()
    except:
        pass  
    response = render_to_response('adjod/userpage.html',context_instance=RequestContext(request))
    response.set_cookie("chat_email", request.user.email)
    response.set_cookie("chat_user", request.user.username)
    response.set_cookie("chat_userid", request.user.id)
    return response


#User Logout definition
def logout_view(request):
    if LastActive.objects.filter(user = request.user.id).exists():
        last_active = LastActive.objects.get(user = request.user.id)
        last_active.delete()
    logout(request)
    response = HttpResponseRedirect("/")
    response.delete_cookie('chat_email')
    response.delete_cookie('chat_user')
    return response


# /*  Auto Complete for Category based Brands */
def autocomplete_keyword(request):
  from collections import OrderedDict
  val = OrderedDict()
  results = []
  keyterm = request.GET.get('term')
  if keyterm:
    unsort_dict = {}
    lead_keywords = Category.objects.filter(name__istartswith=keyterm)
    # print 'lead_keywords',lead_keywords
    for lead_keyword in lead_keywords:
      keyword_strip = lead_keyword.name.strip()
      keyword_title = keyword_strip.title()
      unsort_dict[keyword_title] = {'id':lead_keyword.id, 'label':keyword_title, 'value':keyword_title}
    sorted_dic = OrderedDict(sorted(unsort_dict.iteritems(), key=lambda v: v[0]))
    for k, v in sorted_dic.iteritems():
      results.append(v)
  return HttpResponse(simplejson.dumps(results), mimetype='application/json')


# /*  Auto Complete for Category based Brands , subCatId='none'*/
def autocomplete_brandlist(request):
  from collections import OrderedDict
  val = OrderedDict()
  results = []
  keyterm = request.GET.get('term')
  if keyterm:
    unsort_dict = {}
    # lead_keywords = Category.objects.filter(name__istartswith=keyterm)
    # print 'lead_keywords',lead_keywords
    # if subCatId
    #     lead_keywords = Category.objects.filter(name__istartswith=keyterm)
    # else
    lead_keywords = Dropdown.objects.filter(name__istartswith=keyterm)
    for lead_keyword in lead_keywords:
      keyword_strip = lead_keyword.name.strip()
      keyword_title = keyword_strip.title()
      unsort_dict[keyword_title] = {'id':lead_keyword.id, 'label':keyword_title, 'value':keyword_title}
    sorted_dic = OrderedDict(sorted(unsort_dict.iteritems(), key=lambda v: v[0]))
    for k, v in sorted_dic.iteritems():
      results.append(v)
  return HttpResponse(simplejson.dumps(results), mimetype='application/json')


#function for Chat
def toolbar(request):
    return render_to_response('views/toolbar.html', context_instance=RequestContext(request))


def loadbasecurrency(request):
    basecurrency = BaseCurrency.objects.get(id=1)
    adjod_base_currency = basecurrency.base_currency
    base_currency_rate = Rate.objects.get(currency= adjod_base_currency)
    open_exchange_rate = Rate.objects.all()
    ExchangeRate.objects.all().delete()
    for rates in open_exchange_rate:
        conversion = ExchangeRate()
        conversion.currency = rates.currency
        conversion.value = float(rates.value)/float(base_currency_rate.value)
        # conversion.value = float("{0:.2f}".format(rates.value))/float("{0:.2f}".format(base_currency_rate.value))
        conversion.save()
    return HttpResponse('Successfully updated')


def update_profile(request):
    return render_to_response('adjod/updateprofile.html', context_instance=RequestContext(request))


def geosearch(request):
    starttime = time()
#     ipaddress = request.GET.get('ipaddress', '')
    ipaddress=get_client_ip(request)
    print 'newip', ipaddress
#     if not ipaddress:
#         ipaddress = globals.ip
    g = GeoIP()
    country = g.country_code(ipaddress)
    print "country:", country
#     language=get_global_language(country)
#     print "language", language
    timetaken = time() - starttime
    language="None"
    country_language_dict = {
                    'AU':'en','IN':'en','SE':'sv','DE':'de','SG':'en','SX':'en',}
    for key,value in country_language_dict.items():
        if country==key:
            language=value
    city=g.city(ipaddress)['city']
    return render_to_response('adjod/testpage.html', {
        'country':country, 'ipaddress':ipaddress, 'timetaken':timetaken,'language':language,'city':city
      }, context_instance=RequestContext(request))

def custom_404(request):
   return render_to_response('404.html')