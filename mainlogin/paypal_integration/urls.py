from django.conf import settings
from django.conf.urls import patterns, include, url

urlpatterns = patterns('',


 url(r'^paypal/$', 'paypal_integration.views.view_that_asks_for_money', name='paypal'),
 url(r'^something/paypal/$', include('paypal.standard.ipn.urls')),

)