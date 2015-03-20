from django.conf import settings
from django.conf.urls import patterns, include, url
from mainlogin.views import *
from advertisement.views import *
from paypal_integration.views import *
from advertisement.forms import *

# from methods import reverse

# from rollyourown.seo.admin import register_seo_admin
# from django.contrib import admin
# from test_project.seo import MyMetadata




# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    url(r'^$', 'mainlogin.views.home', name='home'),
    # url(r'^mainlogin/', include('mainlogin.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),

    url(r'^home/$', 'mainlogin.views.home', name='home'),
    
    url(r'^postad/(?P<name>.*)/(?P<subname>.*)/$', 'advertisement.views.post_ad',name='subcategory_name'),
    url(r'^postad/(?P<name>.*)/$', 'advertisement.views.sub_category',name='category_name'),

    url(r'^login/$', 'mainlogin.views.user_login', name='user_login'),
    url(r'^start/$', 'mainlogin.views.start',name='start'),
    url(r'^new_user/$', 'mainlogin.views.register', name='register'),
    url(r'^confirm/(?P<confirmation_code>.*)/(?P<username>.*)/', 'mainlogin.views.confirm',name='confirm' ),
    url(r'^search/$', 'advertisement.views.search', name='search'),
    url(r'^ads/(?P<pk>\d+)/$', 'advertisement.views.ad_info',name='ad_info'),
    url(r'^addproduct/$', 'advertisement.views.add_product',name='add_product'),
    url(r'^paypal/$', 'mainlogin.views.view_that_asks_for_money', name='paypal'),
    url(r'^something/paypal/$', include('paypal.standard.ipn.urls')),
    url(r'^localities_for_city/$','advertisement.views.localities_for_city', name='localities_for_city'),
    url(r'^models_for_brand/$','advertisement.views.models_for_brand', name='models_for_brand'),
        
    url(r'^logout/$', 'mainlogin.views.logout_view', name='logout_view'),
    
    url(r'^v3/postad/$', 'advertisement.views.post_ad_v3', name='post_ad_v3'),

    url(r'^postad/$', 'advertisement.views.post_ad1',name='postad'),
    
    url(r'^subcategory_for_category/$', 'advertisement.views.subcategory_for_category',name='subcategory'),
    
    
    # # url(r'^userpage/$', 'mainlogin.views.user_page',name='userpage'),
    # # url(r'^start/(?P<user_id>\d+)/$', 'mainlogin.views.start',name='start'),

    # url(r'^start/$', 'mainlogin.views.start',name='start'),

    

  
    # url(r'^postpage/$', 'advertisement.views.post_page',name='post_page'),
    # url(r'^addproduct/$', 'advertisement.views.add_product',name='add_product'),
    
    
    
    # url(r'^categorypage/$', 'advertisement.views.category_page',name='category_page'),
    # url(r'^postad/(?P<subid>\d+)$', 'advertisement.views.post_ad',name='post_ad'),
    
    # url(r'^subcategory/(?P<id>\d+)$', 'advertisement.views.sub_category',name='sub_category'),
    # url(r'^sample/$', 'sample.views.sample_home',name='sample_home'),
    # url(r'^samplesave/$', 'sample.views.sample_save',name='sample_save'),
    # # url(r'^advertisement/(?P<categoryname>.*)/(?P<id>\d+)$', 'mainlogin.views.sub_category1',name='sub_category1'),
    # url(r'^advertisement/(?P<subcategoryname>.*)/(?P<subid>\d+)$', 'mainlogin.views.view_ads',name='view_ads'),
    # url(r'^elasticsearch/$', 'advertisement.views.notes',name='notes'),
    # url(r'^search/', include('haystack.urls')),
    # url(r'^confirm/(?P<confirmation_code>.*)/(?P<username>.*)/', 'mainlogin.views.confirm',name='confirm' ),
    


    
   
    
)

# register_seo_admin(admin.site, MyMetadata)
   