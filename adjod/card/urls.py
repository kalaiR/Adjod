from django.conf.urls import patterns, url

urlpatterns = patterns('card.views',
    url(r'^actor/$', 'actor_card', name='actorcard'),
    url(r'^actor/basic/$', 'actor_basic', name='actorbasic'),
    url(r'^actor/trans/$', 'get_transactions', name='actortxn'),
    url(r'^actor/bought/$', 'get_boughtlead', name='bought'),
    url(r'^actor/viewedlead/$', 'get_viewedlead', name='viewedlead'),
    url(r'^actor/latestsearch/$', 'get_latestsearch', name='latestsearch'),
    url(r'^actor/filter/$', 'get_leadfilter', name='actorfilter'),
    url(r'^actor/nemails/$', 'get_notice_emails', name='actornotice'),
    url(r'^actor/search/$', 'search_actor', name='searchactor'),
    url(r'^actor/invoice/$', 'get_invoices', name='actorinvoice'),
    url(r'^actor/subsc/$', 'get_subscriptions', name='actorsubsc'),
    url(r'^actor/bid/$', 'get_bids', name='actorbid'),
    #Below urls are for leadcard 
    url(r'^lead/$', 'lead_card', name='leadcard'),
    url(r'^lead/basic/$', 'lead_basic', name='leadbasic'),
    url(r'^lead/search/$', 'search_lead', name='searchlead'),
)
