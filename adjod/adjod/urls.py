
from django.conf import settings
from django.conf.urls import patterns, include, url
from adjod.views import *
from advertisement.views import *
from paypal_integration.views import *
from advertisement.forms import *
from django.contrib import admin
from haystack.views import SearchView, FacetedSearchView
from advertisement.models import Product
from advertisement.searchform import ProductSearchFilter
from advertisement.fixido_search import AdjodSearchView, AdjodSearchViewSubCategory
from django.template.loader import add_to_builtins
add_to_builtins('advertisement.templatetags.app_filters')
admin.autodiscover()

urlpatterns = patterns('',
    # url(r'^adjod/', include('adjod.foo.urls')),url(r'^admin/', include(admin.site.urls)),
    url(r'^$', 'adjod.views.home', name='home'),
    
    # Home page URL
    url(r'^home/$', 'adjod.views.home', name='home'),

    # URL for enter post form page
    url(r'^postad/$', 'advertisement.views.product_form',name='product_form'),
    
    
    # User login verfication
    url(r'^login/$', 'adjod.views.user_login', name='user_login'),

    # User Dashboard page after login
    url(r'^start/$', 'adjod.views.start',name='start'),

    # New user Registration URL
    url(r'^new_user/$', 'adjod.views.register', name='register'),

    # Email confirmation URL, it calls when user click the URL from their mail for user verification
    url(r'^confirm/(?P<confirmation_code>.*)/(?P<username>.*)/', 'adjod.views.confirm',name='confirm' ),
    
    # For view full detail of particular product with their id
    url(r'^ads/(?P<pk>\d+)/$', 'advertisement.views.product_detail',name='product_detail'),
    
    # For save product
    url(r'^addproduct/$', 'advertisement.views.product_save',name='product_save'),
    
    # Paypal
    url(r'^paypal/$', 'adjod.views.view_that_asks_for_money', name='paypal'),
    url(r'^something/paypal/$', include('paypal.standard.ipn.urls')),
    
    # Find locality for city when ajax call
    url(r'^localities_for_city/$','advertisement.views.localities_for_city', name='localities_for_city'),

    # Logout URL
    url(r'^logout/$', 'adjod.views.logout_view', name='logout_view'),
    
    # For view Front end design of detail page and post form page
    url(r'^v2/postad/$', 'advertisement.views.post_ad_v2', name='post_ad_v2'),
    url(r'^v3/addetail/$', 'advertisement.views.ad_detail_v3', name='ad_detail_v3'),
    
    # Find Subcategory when ajax call
    url(r'^subcategory_for_category/$', 'advertisement.views.subcategory_for_category',name='subcategory'),
    
    # Find Brand when ajax call
    url(r'^brand_for_subcategory/$', 'advertisement.views.brand_for_subcategory',name='brand'),
    
    # API
    url(r'^(?i)apidocs/', include('fxapi.urls')),
    
    # Default search URL
    url(r'^(?i)search/', AdjodSearchView(
      template='advertisement/quikr_search_v2.html', 
      form_class=ProductSearchFilter), name='searchPageV2'),
    
    # Search By Category URL
    url(r'^(?i)(?P<categoryname>.*)/(?P<subcategoryname>.*)/', AdjodSearchViewSubCategory(
      template='advertisement/quikr_search_v2.html', 
      form_class=ProductSearchFilter), name='searchPageV2'),
    
    # Find Subcategory with pass category dynamically in url
    url(r'^(?i)(?P<pname>.*)/$', 'advertisement.views.sub_category',name='sub_category'),

    # url(r'^postad/(?P<name>.*)/$', 'advertisement.views.sub_category',name='category_name'),
    
)


   