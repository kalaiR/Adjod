from django.db import models
from django.contrib.auth.models import User
from django.contrib.sessions.models import Session
from adjod.models import UserProfile
from advertisement.models import *


# class ChatMessage(models.Model):
#     sender   = models.ForeignKey(UserProfile, related_name = 'sender_user')
#     receiver = models.ForeignKey(UserProfile, related_name = 'receiver_user')
#     message  = models.CharField(max_length = 200)
#     received_at = models.DateTimeField(auto_now_add = True)
# #     session = models.ForeignKey(Session, related_name='session_message')
#     is_read = models.BooleanField()
    
#     def __str__(self):
#         return self.session
    
class ChatMessage(models.Model):
    sender   = models.CharField(max_length=50)
    receiver = models.CharField(max_length=50)
    product=models.ForeignKey(Product)
    message  = models.CharField(max_length = 200)
    received_at = models.DateTimeField(auto_now_add = True)
#     session = models.ForeignKey(Session, related_name='session_message')
    is_read = models.BooleanField()
    created_date=models.DateTimeField(auto_now = True)
    
    # def __str__(self):
    #     return self.session

    def __unicode__(self):
        return self.user.sender    

class LastActive(models.Model):    
    user   = models.OneToOneField(UserProfile, primary_key = True)
    received_at = models.DateTimeField(auto_now = True)
    session = models.ForeignKey(Session, related_name='session_active')

    def __str__(self):
        return self.user.id

# class VideoSession(models.Model):
#     sender   = models.ForeignKey(User, related_name = 'sender_user1')
#     receiver = models.ForeignKey(User, related_name = 'receiver_user1')
#     session_id  = models.CharField(max_length = 255)
#     token_id    = models.TextField()
    