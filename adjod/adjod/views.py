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
    ctx = {}
    if request.user.is_superuser:
        logout(request)
        return HttpResponseRedirect('/')  
    if request.user.is_authenticated():
        userprofile=UserProfile.objects.get(user=request.user.id)
        ctx={'userprofile':userprofile}
    return render_to_response('adjod/userpage.html', ctx , context_instance=RequestContext(request)) 

@csrf_protect 
def user_login(request):
    if request.method == 'POST':
        username = request.POST['email_id']
        password = request.POST['password']
        if 'search' in request.POST['next']:
            next_url = request.POST['next'].split('&')[0]
        else:
            next_url = request.POST['next'].split('?')[0]
        print "next_url", next_url
        try:
            error={}
            if '@' in username:
                if not User.objects.filter(email=username).exists():
                    error['email_exists'] = ugettext('Email Doesnot exists')
                    print "error['email_exists']",error['email_exists']
                    raise ValidationError(error['email_exists'], 1)
            else:
                if not User.objects.filter(username=username).exists():
                    error['username_exists'] = ugettext('Username Doesnot exists')
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
                error={}
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
                    error = ugettext('Account disable')
                    return errorHandle(error)               
            else:
                # Bad login details were provided. So we can't log the user in.            
                error = ugettext('Invalid user')
                print "error", error
                return errorHandle(error) 
    else:
      category=Category.objects.all()
      return render_to_response('adjod/userpage.html', {'category':category}, context_instance=RequestContext(request))

#User registration definition
@csrf_protect
def register(request):
    user=User()
    userprofile=UserProfile()
    # If it's a HTTP POST, we're interested in processing form data.
    if request.method == 'POST':
        email=request.POST['email_id']
        username=request.POST['user_id']
        try:
            error={}
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
            user.is_active = True
            user.username=request.POST['user_id']
            user.email=request.POST['email_id']
            user.password=request.POST['password']
            user.set_password(user.password)
            user.first_name=request.POST['user_id']
            user.save()
            userprofile.user=user       
            userprofile.mobile=request.POST['your_mobile_number']
            if request.COOKIES.get('city'):
                userprofile.city=City.objects.get(city=request.COOKIES.get('city'))
            userprofile.language=request.COOKIES.get('adjod_language')
            userprofile.country_code = userprofile.city.country_code
            userprofile.age_status=request.POST.get('confirm')           
            confirmation_code = ''.join(random.choice(string.ascii_uppercase + string.digits + string.ascii_lowercase) for x in range(33))
            p = UserProfile(user=user, city=userprofile.city, mobile=userprofile.mobile, confirmation_code=confirmation_code, language=userprofile.language,age_status=userprofile.age_status, country_code =userprofile.country_code)         
            p.save()           
            send_registration_confirmation(user)
            user = User.objects.get(username=user.username)
            user.backend='django.contrib.auth.backends.ModelBackend'
            login(request, user)
            return HttpResponseRedirect('/start/?user_id=' + str(user.id)) 
    
def send_registration_confirmation(user):
    p = user.get_profile()
    title = "Adjod account confirmation"
    content = "http://" + settings.SITE_NAME + "/confirm/" + str(p.confirmation_code) + "/" + user.username
    send_templated_mail(
                template_name = 'welcome',
                subject = 'Welcome to Resellbuy.com',
                from_email = 'testmail123sample@gmail.com',
                recipient_list = [user.email],
                context={
                         'user': user,
                         'content':content,             
                },
            )

def confirm(request, confirmation_code, username):    
    try:
        user = User.objects.get(username=username)        
        print user.id
        profile = user.get_profile()       
        if profile.confirmation_code == confirmation_code:
            # user.is_active = True
            profile.is_emailverified=True
            print "user.is_emailverified", profile.is_emailverified
            # user.save()
            profile.save()
            user.backend='django.contrib.auth.backends.ModelBackend'
            login(request, user)
            print "confirm7"
        return HttpResponseRedirect('/start/?user_id=' + str(user.id))    
    except:
        return HttpResponseRedirect('/')
    
def start(request):
    user=UserProfile.objects.get(user=request.user.id)
    #Chat Store Active users
    last_active = None
    try:
        last_active = LastActive.objects.get(user = UserProfile.objects.get(id=user.id))
    except:         
        last_active = LastActive.objects.create(user = UserProfile.objects.get(id=user.id), session = Session.objects.get(session_key = request.session.session_key))
    last_active.save()
    if request.user.is_authenticated:
        userprofile=UserProfile.objects.get(user=request.user.id)
    return render_to_response('adjod/userpage.html',{'userprofile':userprofile},context_instance=RequestContext(request))

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

#User Logout definition
def logout_view(request):
    # user=UserProfile.objects.get(user=request.user.id)
    # if LastActive.objects.filter(user = user.id).exists():
    #     last_active = LastActive.objects.get(user = user.id)
    #     last_active.delete()
    logout(request)
    response = HttpResponseRedirect("/")
    response.delete_cookie('chat_email')
    response.delete_cookie('chat_user')
    return response

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
# def chat(request):
#     return render_to_response('chat_index.html', context_instance=RequestContext(request))    
def toolbar(request):
    return render_to_response('views/toolbar.html', context_instance=RequestContext(request))    

