from django.conf import settings
from django.conf.urls import patterns, include, url
from adjod.views import *
from advertisement.views import *
from paypal_integration.views import *
from advertisement.forms import *
# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    url(r'^$', 'adjod.views.home', name='home'),
    # url(r'^adjod/', include('adjod.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),

    url(r'^home/$', 'adjod.views.home', name='home'),
    
    url(r'^postad/(?P<name>.*)/(?P<subname>.*)/$', 'advertisement.views.product_form',name='subcategory_name'),
    url(r'^postad/(?P<name>.*)/$', 'advertisement.views.sub_category',name='category_name'),

    url(r'^login/$', 'adjod.views.user_login', name='user_login'),
    url(r'^start/$', 'adjod.views.start',name='start'),
    url(r'^new_user/$', 'adjod.views.register', name='register'),
    url(r'^confirm/(?P<confirmation_code>.*)/(?P<username>.*)/', 'adjod.views.confirm',name='confirm' ),
    url(r'^search/$', 'advertisement.views.search', name='search'),
    url(r'^ads/(?P<pk>\d+)/$', 'advertisement.views.product_detail',name='product_detail'),
    url(r'^addproduct/$', 'advertisement.views.product_save',name='product_save'),
    url(r'^paypal/$', 'adjod.views.view_that_asks_for_money', name='paypal'),
    url(r'^something/paypal/$', include('paypal.standard.ipn.urls')),
    url(r'^localities_for_city/$','advertisement.views.localities_for_city', name='localities_for_city'),
    url(r'^models_for_brand/$','advertisement.views.models_for_brand', name='models_for_brand'),
        
    url(r'^logout/$', 'adjod.views.logout_view', name='logout_view'),
    
    url(r'^v3/postad/$', 'advertisement.views.product_form_v3', name='product_form_v3'),
    
    
    
    
    # # url(r'^userpage/$', 'adjod.views.user_page',name='userpage'),
    # # url(r'^start/(?P<user_id>\d+)/$', 'adjod.views.start',name='start'),

    # url(r'^start/$', 'adjod.views.start',name='start'),

    

  
    # url(r'^postpage/$', 'advertisement.views.post_page',name='post_page'),
    # url(r'^addproduct/$', 'advertisement.views.product_save',name='product_save'),
    
    
    
    # url(r'^categorypage/$', 'advertisement.views.category_page',name='category_page'),
    # url(r'^postad/(?P<subid>\d+)$', 'advertisement.views.product_form',name='product_form'),
    
    # url(r'^subcategory/(?P<id>\d+)$', 'advertisement.views.sub_category',name='sub_category'),
    # url(r'^sample/$', 'sample.views.sample_home',name='sample_home'),
    # url(r'^samplesave/$', 'sample.views.sample_save',name='sample_save'),
    # # url(r'^advertisement/(?P<categoryname>.*)/(?P<id>\d+)$', 'adjod.views.sub_category1',name='sub_category1'),
    # url(r'^advertisement/(?P<subcategoryname>.*)/(?P<subid>\d+)$', 'adjod.views.view_ads',name='view_ads'),
    # url(r'^elasticsearch/$', 'advertisement.views.notes',name='notes'),
    # url(r'^search/', include('haystack.urls')),
    # url(r'^confirm/(?P<confirmation_code>.*)/(?P<username>.*)/', 'adjod.views.confirm',name='confirm' ),
    


    
   
    
)

# register_seo_admin(admin.site, MyMetadata)
   