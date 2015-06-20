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
# from django.contrib.gis.geoip import GeoIP

#Paypal transaction definition
@csrf_exempt
def show_me_the_money(sender, **kwargs):
    print "show_me_the_money"
    ipn_obj = sender
    payStatus=ipn_obj.POST.get('payment_status','')
    if payStatus=='Completed':
        print "show_me_the_money1"
    # Undertake some action depending upon `ipn_obj`.
    # if ipn_obj.custom == "Upgrade all users!":
    #     User.objects.update(paid=True)        
print "show_me_the_money2"
payment_was_successful.connect(show_me_the_money)

def notify(request):
    print "notify"
    print "request", request.REQUEST['business']
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
    locality =Locality.objects.all() 
    return render_to_response('adjod/userpage.html', {'category':category, 'path':path, 'recentad':recentad, 'locality':locality }, context_instance=RequestContext(request)) 

#User login defintion
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
 
        # Use Django's machinery to attempt to see if the username/password
        # combination is valid - a User object is returned if it is.
        user = authenticate(username=username, password=password)
 
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
                return HttpResponseRedirect('/start/?user_id=' + str(user.id))               
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
      form = UserForm() # An unbound form
      print "5"
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
        print request.POST['email_id']
        print request.POST['password']
        print request.POST['city']
        print request.POST['your_mobile_number']
        user.is_active = False
        user.username=request.POST['email_id']
        user.email=request.POST['email_id']
        user.password=request.POST['password']
        user.set_password(user.password)
        user.save()
        userprofile.user=user
        userprofile.city=request.POST['city']
        userprofile.mobile=request.POST['your_mobile_number']
        print "request.COOKIES.get('adjod_language')", request.COOKIES.get('adjod_language')
        userprofile.language=request.COOKIES.get('adjod_language')
        print "request.COOKIES.get('country')", request.COOKIES.get('country')
        userprofile.country=request.COOKIES.get('country')
        
        confirmation_code = ''.join(random.choice(string.ascii_uppercase + string.digits + string.ascii_lowercase) for x in range(33))
        print confirmation_code
        p = UserProfile(user=user, city=userprofile.city, mobile=userprofile.mobile, confirmation_code=confirmation_code, language=userprofile.language, country=userprofile.country)
        
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
        print "send mail" 
        # confirm(user,confirmation_code, user.username)
        print "send confirmation"
        return HttpResponseRedirect('../../../../../')

        # Update our variable to tell the template registration was successful.
        registered = True
 
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
    return render_to_response('advertisement/ad_post.html', {'registered': registered},
                                context_instance=RequestContext(request))
     
def send_registration_confirmation(user):
    p = user.get_profile()
    title = "Adjod account confirmation"
    content = "http://localhost:8000/confirm/" + str(p.confirmation_code) + "/" + user.username
    # content = "http://localhost:8000/confirm/" + str(p.confirmation_code) + "/" + user.username
    send_mail(title, content, 'no-reply@gsick.com', [user.email], fail_silently=False)

def confirm(request, confirmation_code, username):    
    try:
        user = User.objects.get(username=username)
        print user.id
        profile = user.get_profile()
       
        # if profile.confirmation_code == confirmation_code and user.date_joined > (datetime.datetime.now()-datetime.timedelta(days=1)):
        if profile.confirmation_code == confirmation_code:
            user.is_active = True
            user.save()
            user.backend='django.contrib.auth.backends.ModelBackend'
            login(request, user)
            print "confirm7"
        return HttpResponseRedirect('/start/?user_id=' + str(user.id))    
    except:
        return HttpResponseRedirect('../../../../../')
    
def start(request):
    print 'start'
    category=Category.objects.all()
    path=request.path
    print path
    product =Product.objects.all()
    recentad=Product.objects.filter().order_by('-id')[:3]
    return render_to_response('adjod/userpage.html',{'category':category,'path':path,'recentad':recentad,'product':product},context_instance=RequestContext(request))

# /*  Auto Complete for Category based Brands */
def autocomplete_keyword(request):     
  from collections import OrderedDict
  val = OrderedDict() 
  results = []  
  keyterm = request.GET.get('term')   
  if keyterm:
    unsort_dict = {}    
    lead_keywords = Category.objects.filter(name__istartswith=keyterm)    
    print 'lead_keywords',lead_keywords
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
    logout(request)
    return HttpResponseRedirect("/")

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