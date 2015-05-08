from django.conf import settings
from django.conf.urls import patterns, include, url
from adjod.views import *
from advertisement.views import *
from searchflow.views import *
from paypal_integration.views import *
from advertisement.forms import *
from django.contrib import admin
from haystack.views import SearchView, FacetedSearchView

# Cusomt Search View
from searchflow.newadjodsearch import NewAdjodSearchView
from searchflow.newsearchform import NewProductSearchFilter

from advertisement.models import Product
from advertisement.searchform import ProductSearchFilter
from advertisement.fixido_search import AdjodSearchView, AdjodSearchViewSubCategory

from django.conf.urls.i18n import i18n_patterns
from django.utils.translation import ugettext_lazy as _
# from adworks import views
# from adworks import models

from django.template.loader import add_to_builtins
add_to_builtins('advertisement.templatetags.app_filters')
admin.autodiscover()

js_info_dict = {
    'packages': ('adjod',),
}

urlpatterns = patterns('',
    # url(r'^adjod/', include('adjod.foo.urls')),

    url(r'^admin/', include(admin.site.urls)),
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

    # AutoComplete for Keywords
    url(r'^(?i)autocomplete_keyword/$', 'adjod.views.autocomplete_keyword', name='autocomplete_keyword'),
    
    # Search & Advance Search     
    url(r'^(?i)search/', NewAdjodSearchView(
      template='searchflow/newquikr_search_v2.html', 
      form_class=NewProductSearchFilter, 
      #results_per_page=settings.SEARCH_PAGE_NUMBER_OF_LEADS
    ), name='newsearchPageV2'),
     
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
    #     url(r'^(?i)search/', AdjodSearchView(
    #     template='advertisement/quikr_search_v2.html', 
    #     form_class=ProductSearchFilter), name='searchPageV2'),

    # Find Subcategory with pass category dynamically in url
    url(r'^(?i)categories/(?P<pname>.*)/$', 'advertisement.views.sub_category',name='sub_category'),

    # url(r'^product/(?P<name>[\w\+]+)/$', 'crunch.views.product_by_name', name='preview_by_name'),
    
    # Search By Category URL
    # url(r'^(?i)search_by_category/(?P<categoryname>.*)/(?P<subcategoryname>.*)/', AdjodSearchViewSubCategory(
    #   template='advertisement/quikr_search_v2.html', 
    #   form_class=ProductSearchFilter), name='searchPageV2'),

    url(r'^(?i)i18n/', include('django.conf.urls.i18n')),
    url(r'^(?i)jsi18n/$', 'django.views.i18n.javascript_catalog', js_info_dict),
    # url(_(r'^dual_language/$'), landing, name='duallang_landing'),

    # url(r'^postad/(?P<name>.*)/$', 'advertisement.views.sub_category',name='category_name'),

    # save free alert url
    url(r'^create_free_alert/$', 'advertisement.views.freealert_save',name='free_alert'),


    # url(r'^client/(?P<pk>\d+)/(?P<token>[-\w]+)/','adworks.views.ClientDetail.as_view()', name='client_detail'),

    # url(r'^campaign/(?P<pk>\d+)/(?P<token>[-\w]+)/',
    #     'adworks.views.CampaignDetail', name='campaign_detail'),

    # url(r'^banner/(?P<pk>\d+)/(?P<token>[-\w]+)/(?P<revision>\d+)/',
    #     'adworks.views.BannerDetail', name='version_detail'),

    # url(r'^banner/(?P<pk>\d+)/(?P<token>[-\w]+)/',
    #     'adworks.views.BannerDetail', name='banner_detail'),

    url(r'^getImages/$', 'advertisement.views.getImages',name='getImages'),

    
)

urlpatterns += i18n_patterns('',
    # (_(r'^dual-lang/'), include('duallang.urls')),
    # (r'^', include('home.urls')),
)