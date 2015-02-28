# Import the UserProfile model individually.
from mainlogin.models import *
from django.contrib import admin
from rollyourown.seo.admin import register_seo_admin
from django.contrib import admin
from test_project.seo import MyMetadata
from rollyourown.seo.admin import get_inline
from rollyourown.seo.admin import auto_register_inlines


# Import the UserProfile model with Category and Page.
# If you choose this option, you'll want to modify the import statement you've already got to include UserProfile.
# from logininew.models import Category, Page, UserProfile

admin.site.register(UserProfile)
# admin.site.register(Advertisement.Advertisementadmin)



register_seo_admin(admin.site, MyMetadata)
# auto_register_inlines(admin.site, MyMetadata)

class MyModelAdmin(admin.ModelAdmin):
    inlines = [get_inline(MyMetadata)]





