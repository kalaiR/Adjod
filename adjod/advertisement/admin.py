from django import forms
from django.forms import widgets
from django.forms.util import flatatt
from django.utils.encoding import smart_unicode
from django.utils.safestring import mark_safe	
from django.utils.translation import ugettext_lazy
from django.contrib import admin
from advertisement.models import *
import pprint
from django.http import HttpResponseRedirect
from django.http import HttpResponse, Http404

class CategoryAdmin(admin.ModelAdmin):
    fields=['icon','name','category_type']
    list_display = ('id', 'icon','name','category_type')
    list_filter = ['name','category_type']
    search_fields = ['id', 'name']
    # readonly_fields =['id']
    list_per_page = 50

class SubCategoryAdmin(admin.ModelAdmin):
    fields=['category','name']
    list_display = ('id', 'category','name')
    list_filter = ['category']
    search_fields = ['id', 'name']
    # readonly_fields =['id']
    list_per_page = 50

class CityAdmin(admin.ModelAdmin):
    fields=['city','country_code','country_name']
    list_display = ('id', 'city','country_code','country_name')
    list_filter = ['city','country_code','country_name']
    search_fields = ['id', 'city','country_code','country_name']
    # readonly_fields =['id']
    list_per_page = 50

class LocalityAdmin(admin.ModelAdmin):
    fields=['city_refid','locality']
    list_display = ('id', 'city_refid','locality')
    list_filter = ['locality']
    search_fields = ['id', 'locality']
    # readonly_fields =['id']
    list_per_page = 50

class DropdownAdmin(admin.ModelAdmin):
    fields=['brand_name','subcat']
    list_display = ('id', 'brand_name','get_brand_subcategory' )
    list_filter = ['brand_name']
    search_fields = ['id', 'brand_name']
    # readonly_fields =['id']
    list_per_page = 50
    
    def get_brand_subcategory(self, obj):
        return "\n".join([p.subcategory for p in obj.brand_subcategory.all()])

class FreeAlertAdmin(admin.ModelAdmin):
    fields=['alert_user','alert_category', 'alert_subcategory', 'alert_brand', 'alert_city', 'alert_locality','alert_email', 'alert_mobile']
    list_display = ('id', 'alert_user','alert_category', 'alert_subcategory', 'alert_locality','alert_brand', 'alert_city', 'alert_email', 'alert_mobile')
    list_filter = ['alert_email', 'alert_mobile']
    search_fields = ['id', 'alert_email','alert_mobile']
    # readonly_fields =['id']
    list_per_page = 50

# class ProductAdmin(admin.ModelAdmin):
#     fields=['userprofile','category', 'subcategory', 'adtype', 'title', 'photos', 'video','condition', 'price', 
#             'ad_brand','ad_year','city', 'locality', 'description', 'you_are', 'you_email','you_phone','created_date','modified_date']
#     list_display = ('id', 'userprofile','category', 'subcategory', 'adtype', 'title', 'photos', 'thumbnail', 'imagecount', 'video','condition', 'price', 
#             'ad_brand','ad_year','city', 'locality', 'description', 'you_are', 'you_email','you_phone','created_date','modified_date')
#     # list_filter = ['alert_email', 'alert_mobile']
#     search_fields = ['id', 'you_email','you_phone']
#     # readonly_fields =['id']
#     list_per_page = 50

class PremiumPriceInfoAdmin(admin.ModelAdmin):
    fields=['premium_price','base_currency','purpose','duration']
    list_display = ('id', 'premium_price','base_currency','purpose','duration')
    list_filter = ['premium_price','base_currency','purpose']
    search_fields = ['premium_price','base_currency','purpose']
    # readonly_fields =['id']
    list_per_page = 50

class ProductAdmin(admin.ModelAdmin):
    list_display = ('id', 'userprofile','category', 'subcategory', 'adtype', 'title', 'photos', 'thumbnail', 'imagecount','condition', 'price', 
            'ad_brand','ad_year','city', 'locality', 'description', 'you_are','you_name', 'you_email','you_phone','ispremium','premium_plan','created_date','modified_date')
    list_filter = ['category', 'subcategory','ispremium','premium_plan']
    search_fields = ['id','category','subcategory', 'you_email','you_phone']
    readonly_fields =['city']
    fieldsets = [
      ('Product Details', {
          'fields': [ 'category', 'subcategory','ad_brand','title', 'description', 
                      'photos', 'condition', 'price','ad_year','city','locality']
      }),

      ('Personal information', {
          'fields': ['userprofile','you_are', 'you_name','you_email', 'you_phone'],
          
      }),
      
      ('Product Subscription Details', {
          'fields': ['ispremium', 'premium_plan']
      }),

      ('Date', {
          'fields': ['created_date', 'modified_date']
      }),
    ]
    list_per_page = 50
    
admin.site.register(PremiumPriceInfo, PremiumPriceInfoAdmin)
admin.site.register(FreeAlert, FreeAlertAdmin)
admin.site.register(Product, ProductAdmin)
admin.site.register(Dropdown, DropdownAdmin)
admin.site.register(Locality, LocalityAdmin)
admin.site.register(City, CityAdmin)
admin.site.register(SubCategory, SubCategoryAdmin)
admin.site.register(Category,CategoryAdmin)
# admin.site.register(Country)
