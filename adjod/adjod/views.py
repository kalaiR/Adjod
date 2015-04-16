
# from adjod.forms import UserForm, UserProfileForm
from adjod.forms import UserForm
import logging
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout
from django.core.context_processors import csrf 
from django.views.decorators.csrf import csrf_protect
from django.shortcuts import render_to_response, render, redirect
from django.core.urlresolvers import reverse
from django.template import RequestContext
from django.contrib.auth import authenticate, login
from django.http import HttpResponseRedirect, HttpResponse
from django import forms
from django.contrib.auth.tokens import default_token_generator
from django.utils.translation import ugettext_lazy as _
from django.utils.translation import ugettext, string_concat
from advertisement.models import *
from advertisement import *
import random
import string
from urllib import unquote, urlencode, unquote_plus
from paypal_integration.views import *
from django.conf import settings

from paypal.standard.forms import PayPalPaymentsForm

def view_that_asks_for_money(request):

    # What you want the button to do.
    paypal_dict = {
        "business": settings.PAYPAL_RECEIVER_EMAIL,
        "amount": "100.00",
        "item_name": "Advertisement Merchant",
        "invoice": "unique-invoice-id",
        "notify_url": "https://www.example.com" + reverse('paypal-ipn'),
        "return_url": "https://www.example.com/your-return-location/",
        "cancel_return": "https://www.example.com/your-cancel-location/",

    }

    # Create the instance.
    form = PayPalPaymentsForm(initial=paypal_dict)
    context = {"form": form}
    return render_to_response("paypal_integration/payment.html", context)

def home(request):
      category=Category.objects.all()
      recentad=Product.objects.filter().order_by('-id')[:3]
      path = request.path
      print path 

    # results = SearchQuerySet().models(Product).autocomplete(title_auto=q)
      return render_to_response('adjod/userpage.html', {'category':category, 'path':path, 'recentad':recentad }, context_instance=RequestContext(request)) 



def logout_view(request):
    logout(request)
    return HttpResponseRedirect("/")

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
                
                return HttpResponseRedirect(starturl)
            else:
                # An inactive account was used - no logging in!
                
                error = ugettext('Account disable')
                return errorHandle(error)
                
        else:
            # Bad login details were provided. So we can't log the user in.
            
            error = ugettext('Invalid user')
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
 
# @csrf_protect 
# def user_login(request):
#     print "user_login"
#     def errorHandle(error):
#         form = UserForm()
#         category=Category.objects.all()
#         recentad=Product.objects.filter().order_by('-id')[:3]
#         print request.path
#         return render_to_response('adjod/userpage.html', {
#                 'error' : error,
#                 'form' : form,'category':category,'recentad':recentad
#         },context_instance=RequestContext(request))
#     # Like before, obtain the context for the user's request.
#     context = RequestContext(request)
#     form = UserForm(request.POST) # A form bound to the POST data
#     # If the request is a HTTP POST, try to pull out the relevant information.
#     if request.method == 'POST':
#         # Gather the username and password provided by the user.
#         # This information is obtained from the login form.
#         username = request.POST['email_id']
#         password = request.POST['password']
 
#         # Use Django's machinery to attempt to see if the username/password
#         # combination is valid - a User object is returned if it is.
#         user = authenticate(username=username, password=password)
 
#         # If we have a User object, the details are correct.
#         # If None (Python's way of representing the absence of a value), no user
#         # with matching credentials was found.
#         if user:
           
#             # Is the account active? It could have been disabled.
#             if user.is_active:
                
#                 # If the account is valid and active, we can log the user in.
#                 # We'll send the user back to the homepage.
#                 login(request, user)
#                 print user.id
#                 user_id=user.id
#                 # starturl=reverse('start',kwargs={ 'user_id': user.id })
#                 return HttpResponseRedirect('/start/?user_id=' + str(user.id))
                
#                 return HttpResponseRedirect(starturl)
#             else:
#                 # An inactive account was used - no logging in!
                
#                 error = ugettext('Account disable')
#                 return errorHandle(error)
                
#         else:
#             # Bad login details were provided. So we can't log the user in.
            
#             error = ugettext('Invalid user')
#             return errorHandle(error)
            
 
#     # The request is not a HTTP POST, so display the login form.
#     # This scenario would most likely be a HTTP GET.
#     else:
#         # No context variables to pass to the template system, hence the
#         # blank dictionary object...
# #          print'successfull'
# #          return HttpResponse("login.")
# #     return render(request, 'adjod/userpage.html', {}) 
#       form = UserForm() # An unbound form
#       print "5"
#       category=Category.objects.all()
#       return render_to_response('adjod/userpage.html', {'category':category}, context_instance=RequestContext(request))

# @csrf_protect
# def register(request):
#     # Like before, get the request's context.
#     context = RequestContext(request)
 
#     # A boolean value for telling the template whether the registration was successful.
#     # Set to False initially. Code changes value to True when registration succeeds.
#     registered = False
 
#     # If it's a HTTP POST, we're interested in processing form data.
#     if request.method == 'POST':
#         # Attempt to grab information from the raw form information.
#         # Note that we make use of both UserForm and UserProfileForm.
#         user_form = UserForm(data=request.POST)
#         profile_form = UserProfileForm(data=request.POST)
 
#         # If the two forms are valid...
#         if user_form.is_valid() and profile_form.is_valid():
#             # Save the user's form data to the database.
#             user = user_form.save()
 
#             # Now we hash the password with the set_password method.
#             # Once hashed, we can update the user object.
#             user.set_password(user.password)
#             # user = User.objects.create_user(user.username, user.email, user.password)
#             user.is_active = False
#             user.save()
#             confirmation_code = ''.join(random.choice(string.ascii_uppercase + string.digits + string.ascii_lowercase) for x in range(33))
#             print confirmation_code
#             p = UserProfile(user=user, confirmation_code=confirmation_code)
            
#             # Now sort out the UserProfile instance.
#             # Since we need to set the user attribute ourselves, we set commit=False.
#             # This delays saving the model until we're ready to avoid integrity problems.
#             # profile = profile_form.save(commit=False)
#             # profile.user = user
 
#             # Did the user provide a profile picture?
#             # If so, we need to get it from the input form and put it in the UserProfile model.
#             if 'picture' in request.FILES:
#                 # profile.picture = request.FILES['picture']
#                 p.picture = request.FILES['picture']
 
#             # Now we save the UserProfile model instance.
#             p.save()
#             # profile.p.save()
            
#             send_registration_confirmation(user)
#             print "send mail" 
#             # confirm(user,confirmation_code, user.username)
#             print "send confirmation"
#             return HttpResponseRedirect('../../../../../')
 
#             # Update our variable to tell the template registration was successful.
#             registered = True
 
#         # Invalid form or forms - mistakes or something else?
#         # Print problems to the terminal.
#         # They'll also be shown to the user.
#         else:
#             print user_form.errors, profile_form.errors
 
#     # Not a HTTP POST, so we render our form using two ModelForm instances.
#     # These forms will be blank, ready for user input.
#     else:
#         user_form = UserForm()
#         profile_form = UserProfileForm()
 
#     # Render the template depending on the context.
#     return render_to_response('adjod/register.html', {'user_form': user_form, 'profile_form': profile_form, 'registered': registered},
#                                 context_instance=RequestContext(request))

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
        
        confirmation_code = ''.join(random.choice(string.ascii_uppercase + string.digits + string.ascii_lowercase) for x in range(33))
        print confirmation_code
        p = UserProfile(user=user, city=userprofile.city, mobile=userprofile.mobile, confirmation_code=confirmation_code)
        
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
    return render_to_response('v3/advertisement/quikr_post_v3.html', {'registered': registered},
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
    for recentads in recentad:  
        print recentads.title
    return render_to_response('adjod/userpage.html',{'category':category,'path':path,'recentad':recentad,'product':product},
        context_instance=RequestContext(request)
    )

