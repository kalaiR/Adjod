# Create your views here.
from django.views.decorators.csrf import csrf_exempt
from chat.models import *
from django.contrib.sessions.models import Session
from django.shortcuts import render_to_response, HttpResponse, render
import datetime
import time
from adjod.models import *
from advertisement.models import *

# @csrf_exempt
# def find_online_users(username):
#     last_active_list = LastActive.objects.filter(received_at__gt = datetime.datetime.now() - datetime.timedelta(seconds=15))
#     users_list = []
#     for last_active in last_active_list:
#         users_list.append(last_active.user.username)    
#     users_list.remove(username)
#     return ",".join(users_list)

@csrf_exempt
def find_online_users(userid):
    print "userid", userid
    # last_active_list = LastActive.objects.filter(received_at__gt = datetime.datetime.now() - datetime.timedelta(seconds=5))
    last_active_list = LastActive.objects.filter(received_at__gt = datetime.datetime.now() - datetime.timedelta(seconds=15))
    users_list = []
    for last_active in last_active_list:
        users_list.append(int(last_active.user.id)) 
        print "users_list", users_list
    users_list.remove(userid)
    print "users_list after remove", users_list
    return ",".join(str(n) for n in users_list)

    # users_list=[49,53,65]
    # return ",".join(str(n) for n in users_list)

def get(request):
    if not request.is_ajax():
        return  HttpResponse (" Not an AJAX request ")  
    if request.method == 'GET':              
        last_active = None
        try:
            last_active = LastActive.objects.get(user = request.user)
        except:        	
            last_active = LastActive.objects.create(user = request.user, session = Session.objects.get(session_key = request.session.session_key))
        last_active.save()
        
        chat_list = ChatMessage.objects.filter(receiver = request.user, is_read = False)
        print "chat_list", chat_list
        #session = Session.objects.get(session_key = request.session.session_key)        
        #print chat_list
        for chat in chat_list:  
            chat.is_read = True
            chat.save()
            print "chat status saved"
            return HttpResponse (chat.sender.first_name + ":" + chat.message)
    #print "========= After Scaling ==============="       
    return HttpResponse('ACTIVE:' + find_online_users(request.user.id))

def get_product(request):
    print "users_list", request.GET.get('users_list')
    user_group=[]

    #only users
    # for users_lists in request.GET.get('users_list').split(','):
    #     print "users_list split", users_lists
    #     userprofile=UserProfile.objects.get(user=users_lists)
    #     user_group.append(int(userprofile.id))
    # print "userprofile", user_group   
    # return HttpResponse(",".join(str(n) for n in user_group))

    #User with products
    if request.GET.get('users_list') == []:
        user_product=None  
        return HttpResponse(user_product)     
    else:
        for users_lists in request.GET.get('users_list').split(','):
            print "users_list split", users_lists
            userprofile=UserProfile.objects.get(user=users_lists)
            print "userprofile", userprofile
            user_group.append(int(userprofile.id))
        print "userprofile", user_group
        user_product=Product.objects.filter(userprofile__in=user_group)
        print "user_product", user_product
        return HttpResponse(",".join(str(n) for n in user_product))

@csrf_exempt
def post(request):
    print "post"
    time.sleep(2)
    if not request.is_ajax():
        HttpResponse (" Not an AJAX request ")
    if request.method == 'POST':
        if request.POST['message']:
            message = request.POST['message']
            print "message", message
            to_user = request.POST['to_user']
            print "to_user", to_user
            user_id=User.objects.get(first_name=str(to_user))
            print "user_id", user_id
            receiver = User.objects.get(id = user_id.id)
            print "receiver", receiver.id
            sender=User.objects.get(id = int(request.user.id))
            print "sender", sender.id
            # ChatMessage.objects.create(sender = request.user.id, receiver = User.objects.get(username = to_user), message = message,  session = Session.objects.get(session_key = request.session.session_key))
            ChatMessage.objects.create(sender = User.objects.get(id = sender.id), receiver = User.objects.get(id = receiver.id), message = message,  session = Session.objects.get(session_key = request.session.session_key))
       
    return HttpResponse (" Not an POST request ")