# Import the UserProfile model individually.
from adjod.models import *
from django.contrib import admin
# from rollyourown.seo.admin import register_seo_admin
# 
# 
# from rollyourown.seo.admin import get_inline
# from rollyourown.seo.admin import auto_register_inlines


# Import the UserProfile model with Category and Page.
# If you choose this option, you'll want to modify the import statement you've already got to include UserProfile.
# from logininew.models import Category, Page, UserProfile

admin.site.register(UserProfile)
admin.site.register(SiteBanner)
# admin.site.register(Advertisement.Advertisementadmin)









