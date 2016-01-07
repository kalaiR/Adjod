#Import the UserProfile model individually.
from adjod.models import *
from django.contrib import admin

class UserProfileAdmin(admin.ModelAdmin):
    fields=['username','email','mobile','city','language','age_status']
    list_display = ('id','username','email','mobile','city','language','age_status')
    list_filter = ['city','language']
    search_fields = ['city', 'language']
    readonly_fields =['city']
    list_per_page = 50   

admin.site.register(UserProfile,UserProfileAdmin)
admin.site.register(BaseCurrency)
admin.site.register(ExchangeRate)

