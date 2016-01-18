from django.contrib import admin
from banner.models import *

class BannerPlanAdmin(admin.ModelAdmin):
    list_display = ('id','page','position', 'price', 'plan_duration','bannertype')
    list_filter = ['page', 'position','bannertype']
    search_fields = ['id', 'page','position','price','plan_duration','bannertype']
    # readonly_fields =['id']
    fieldsets = [
      ('Add BannerPlan', {
          'fields': [ 'page','position','price', 'plan_duration','bannertype']
      }),
    ]
    list_per_page = 50

class PostBannerAdmin(admin.ModelAdmin):
    list_display = ('id','banner','link', 'bannerplan', 'startdate','enddate','admin_status')
    list_filter = ['bannerplan', 'admin_status']
    search_fields = ['id', 'bannerplan','admin_status']
    #readonly_fields =['id']
    fieldsets = [
      ('Add Banner', {
          'fields': ['banner','link','bannerplan', 'startdate','enddate','admin_status']
      }),
    ]
    list_per_page = 50

admin.site.register(PostBanner, PostBannerAdmin)
admin.site.register(BannerPlan, BannerPlanAdmin)
