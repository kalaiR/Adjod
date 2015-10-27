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
from adjod.forms import UserForm
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

# For GEO
from django.contrib.gis.geoip import GeoIP

# from django.contrib.sites.models import get_current_site

from adjod.util import format_redirect_url
from django.core.exceptions import ValidationError
from django.contrib import messages

# For Chat
from chat.models import *

#For Currency
from moneyed import Money
from djmoney_rates.utils import convert_money
from djmoney_rates.data import CURRENCIES_BY_COUNTRY_CODE
from adjod import globals
from adjod.util import *

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
    category=Category.objects.all()
    recentad=Product.objects.filter().order_by('-id')[:3]
    path = request.path
    print "path", path  
    current_country_cities = get_current_country_cities(request)
    ctx={'category':category, 'path':path, 'recentad':recentad,'current_country_cities':current_country_cities}
    # ctx={'category':category, 'path':path, 'recentad':recentad}   
    if request.user.is_authenticated():
        userprofile=UserProfile.objects.get(user=request.user.id)
        ctx={'category':category, 'path':path, 'recentad':recentad, 'current_country_cities':current_country_cities,'userprofile':userprofile}
    # current_site =get_current_site(request)
    # print "current_site", current_site
    return render_to_response('adjod/userpage.html', ctx , context_instance=RequestContext(request)) 

# def login_error(request):
#     messages = get_messages(request)
#     return render_to_response('error.html', { 'messages': messages })

    # if request.is_ajax():
    #     template = page_template
    # return render_to_response(template, {
    #         'leads':leads, 'error_message':error_message,
    #         'form': DocumentForm(), 'formdata':{},
    #         'page_template': page_template,
    #         'home_paginate': settings.HOME_PAGE_PAGINATION
    #     }, context_instance=RequestContext(request))

@csrf_protect 
def user_login(request):
    print "user_login"
    def errorHandle(error):
        form = UserForm()
        category=Category.objects.all()
        recentad=Product.objects.filter().order_by('-id')[:3]
        print request.path
        return render_to_response('adjod/userpage.html', {
                'error' : error,
                'form' : form,'category':category,'recentad':recentad
        },context_instance=RequestContext(request))
    # Like before, obtain the context for the user's request.
    context = RequestContext(request)
    form = UserForm(request.POST) # A form bound to the POST data
    # If the request is a HTTP POST, try to pull out the relevant information.
    if request.method == 'POST':
        # Gather the username and password provided by the user.
        # This information is obtained from the login form.
        username = request.POST['email_id']
        password = request.POST['password']
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
            redirect_path = "/login/"
            query_string = 'si=%d' % e.code
            redirect_url = format_redirect_url(redirect_path, query_string)
            return HttpResponseRedirect(redirect_url)

        # Use Django's machinery to attempt to see if the username/password
        # combination is valid - a User object is returned if it is.
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
                redirect_path = "/login/"
                query_string = 'si=%d' % e.code
                redirect_url = format_redirect_url(redirect_path, query_string)
                return HttpResponseRedirect(redirect_url)
 
        # If we have a User object, the details are correct.
        # If None (Python's way of representing the absence of a value), no user
        # with matching credentials was found.
            if user:           
                # Is the account active? It could have been disabled.
                if user.is_active:                
                    # If the account is valid and active, we can log the user in.
                    # We'll send the user back to the homepage.
                    login(request, user)
                    print user.id
                    user_id=user.id
                    # starturl=reverse('start',kwargs={ 'user_id': user.id })
                    response=HttpResponseRedirect('/start/?user_id=' + str(user.id)) 
                    # response.set_cookie("chat_email", request.POST['email_id'])  
                    # response.set_cookie("chat_password", request.POST['password'])  

                    response.set_cookie("chat_email", user.email)  
                    response.set_cookie("chat_user", user.username)  
                    response.set_cookie("chat_userid", user_id)
                    return response               
                    # return HttpResponseRedirect(starturl)
                else:
                    # An inactive account was used - no logging in!                
                    error = ugettext('Account disable')
                    return errorHandle(error)               
            else:
                # Bad login details were provided. So we can't log the user in.            
                error = ugettext('Invalid user')
                print "error", error
                return errorHandle(error) 
    # The request is not a HTTP POST, so display the login form.
    # This scenario would most likely be a HTTP GET.
    else:
        # No context variables to pass to the template system, hence the
        # blank dictionary object...
#          print'successfull'
#          return HttpResponse("login.")
#     return render(request, 'adjod/userpage.html', {}) 
      form = UserForm() # An unbound for
      category=Category.objects.all()
      return render_to_response('adjod/userpage.html', {'category':category}, context_instance=RequestContext(request))

#User registration definition
@csrf_protect
def register(request):
    # Like before, get the request's context.
    context = RequestContext(request)
 
    # A boolean value for telling the template whether the registration was successful.
    # Set to False initially. Code changes value to True when registration succeeds.
    registered = False
    user=User()
    userprofile=UserProfile()

    # If it's a HTTP POST, we're interested in processing form data.
    if request.method == 'POST':
        # Attempt to grab information from the raw form information.
        # Note that we make use of both UserForm and UserProfileForm.
        # user_form = UserForm(data=request.POST)
        # profile_form = UserProfileForm(data=request.POST)
 
        # If the two forms are valid...
        # if user_form.is_valid() and profile_form.is_valid():
        #     # Save the user's form data to the database.
        #     user = user_form.save()
 
            # Now we hash the password with the set_password method.
            # Once hashed, we can update the user object.
            # user.set_password(user.password)
            # user = User.objects.create_user(user.username, user.email, user.password)
        # print request.POST['email_id']
        # print request.POST['password']
        # print request.POST['city']
        # print request.POST['your_mobile_number']

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
            # print "request.COOKIES.get('adjod_language')", request.COOKIES.get('adjod_language')
            userprofile.language=request.COOKIES.get('adjod_language')
            # print "request.COOKIES.get('country')", request.COOKIES.get('country')
            # country_id=Country.objects.get(code=request.COOKIES.get('country'))
            # print "country_id", country_id.id
            # userprofile.country=Country.objects.get(id=country_id.id)
            userprofile.age_status=request.POST.get('confirm')
            
            confirmation_code = ''.join(random.choice(string.ascii_uppercase + string.digits + string.ascii_lowercase) for x in range(33))
            # print confirmation_code
            # p = UserProfile(user=user, city=userprofile.city, mobile=userprofile.mobile, confirmation_code=confirmation_code, language=userprofile.language, country=userprofile.country, age_status=userprofile.age_status)
            p = UserProfile(user=user, city=userprofile.city, mobile=userprofile.mobile, confirmation_code=confirmation_code, language=userprofile.language,age_status=userprofile.age_status)
            # Now sort out the UserProfile instance.
            # Since we need to set the user attribute ourselves, we set commit=False.
            # This delays saving the model until we're ready to avoid integrity problems.
            # profile = profile_form.save(commit=False)
            # profile.user = user

            # Did the user provide a profile picture?
            # If so, we need to get it from the input form and put it in the UserProfile model.
            # if 'picture' in request.FILES:
            #     # profile.picture = request.FILES['picture']
            #     p.picture = request.FILES['picture']

            # Now we save the UserProfile model instance.
            p.save()
            # profile.p.save()
            
            send_registration_confirmation(user)
            # print "send mail" 
            # confirm(user,confirmation_code, user.username)
            # print "send confirmation"
            # return HttpResponseRedirect('../../../../../')
            registered = True
            user = User.objects.get(username=user.username)
            user.backend='django.contrib.auth.backends.ModelBackend'
            login(request, user)
            return HttpResponseRedirect('/start/?user_id=' + str(user.id)) 

            # Update our variable to tell the template registration was successful.
            
     
            # Invalid form or forms - mistakes or something else?
            # Print problems to the terminal.
            # They'll also be shown to the user.
            # else:
            #     print user_form.errors, profile_form.errors
     
        # Not a HTTP POST, so we render our form using two ModelForm instances.
        # These forms will be blank, ready for user input.
        # else:
        #     user_form = UserForm()
        #     profile_form = UserProfileForm()
     
        # Render the template depending on the context.
        # return render_to_response('advertisement/ad_post.html', {'registered': registered},
        #                             context_instance=RequestContext(request))
            
            # messages.add_message(request, "successfully registered")            
            # return HttpResponseRedirect('/?st=success')

     
def send_registration_confirmation(user):
    p = user.get_profile()
    title = "Adjod account confirmation"
    content = "http://" + settings.SITE_NAME + "/confirm/" + str(p.confirmation_code) + "/" + user.username
    # content = "http://localhost:8000/confirm/" + str(p.confirmation_code) + "/" + user.username
    # send_mail(title, content, 'no-reply@gsick.com', [user.email], fail_silently=False)
    send_templated_mail(
                template_name = 'welcome',
                subject = 'Welcome to Quikr.com',
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
       
        # if profile.confirmation_code == confirmation_code and user.date_joined > (datetime.datetime.now()-datetime.timedelta(days=1)):
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
        return HttpResponseRedirect('../../../../../')
    
def start(request):
    # print 'start'
    city=City.objects.all()
    category=Category.objects.all()
    path=request.path
    print path
    product =Product.objects.all()
    recentad=Product.objects.filter().order_by('-id')[:3]
    user=UserProfile.objects.get(user=request.user.id)
    print "user", user.id
    current_country_cities = get_current_country_cities(request)
    #Chat Store Active users
    last_active = None
    try:
        last_active = LastActive.objects.get(user = UserProfile.objects.get(id=user.id))
    except:         
        last_active = LastActive.objects.create(user = UserProfile.objects.get(id=user.id), session = Session.objects.get(session_key = request.session.session_key))
    last_active.save()
    if request.user.is_authenticated:
        userprofile=UserProfile.objects.get(user=request.user.id)
    return render_to_response('adjod/userpage.html',{'category':category,'path':path,'recentad':recentad,'product':product,'city':city, 'userprofile':userprofile, 'current_country_cities':current_country_cities},context_instance=RequestContext(request))

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
#     user=UserProfile.objects.get(user=request.user.id)
#     if LastActive.objects.filter(user = user.id):
#         last_active = LastActive.objects.get(user = user.id)
#         last_active.delete()
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

def search_new(request):
    print "search_new"
    products=Product.objects.all()
    print 'pro', products
    return render_to_response('adjod/new_search.html', {'products':products}, context_instance=RequestContext(request))

def chat(request):
    return render_to_response('chat_index.html', context_instance=RequestContext(request))

def dialog_login(request):
    return render_to_response('views/dialog-login.html', context_instance=RequestContext(request))   
    
def toolbar(request):
    return render_to_response('views/toolbar.html', context_instance=RequestContext(request))    

def main_chat(request):
    return render_to_response('views/main-chat.html', context_instance=RequestContext(request))    

def options(request):
    return render_to_response('views/options.html', context_instance=RequestContext(request))     

def convert(price):
    user_ip = globals.ip
    # local
    if user_ip.startswith('127.0.0') or user_ip.startswith('192.168.1'):
        user_ip = '114.69.235.2'
    g = GeoIP()
    country_id = g.country_code(user_ip)
    print "country_id", country_id
    for key,value in CURRENCIES_BY_COUNTRY_CODE.items():
        if str(key) == str(country_id):
            isocode=value
    current_country = isocode
    base_currency= settings.BASE_CURRENCY
    exchange_rate = convert_money(price,base_currency,current_country)
    return exchange_rate
