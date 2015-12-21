#Import the UserProfile model individually.
from adjod.models import *
from django.contrib import admin

#Admin functionalities for userprofile model
class UserProfileAdmin(admin.ModelAdmin):
    fields=['user','city','mobile','confirmation_code']
    list_display = ('id', 'user','city','mobile','confirmation_code' )
    list_filter = ['city']
    search_fields = ['id', 'mobile']
    list_per_page = 50   
admin.site.register(UserProfile,UserProfileAdmin)
admin.site.register(BaseCurrency)
admin.site.register(ExchangeRate)