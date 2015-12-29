from django.contrib import admin
from banner.models import *

class PostBannerAdmin(admin.ModelAdmin):
    fields=['banner','link', 'bannerplan', 'startdate','enddate','admin_status']
    list_display = ('id','banner','link', 'bannerplan', 'startdate','enddate','admin_status')
    list_filter = ['bannerplan', 'admin_status']
    search_fields = ['id', 'bannerplan','admin_status']
    readonly_fields =['id']
    list_per_page = 50

admin.site.register(PostBanner, PostBannerAdmin)
admin.site.register(BannerPlan)
 