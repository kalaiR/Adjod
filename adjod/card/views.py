import os
import operator

from django.conf import settings
from django.contrib.admin.views.decorators import staff_member_required
from django.core.exceptions import PermissionDenied
from django.db.models import F, Q
from django.http import HttpResponse, Http404
from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404, render_to_response
from django.template import RequestContext
from django.db.models import Count, Sum, Avg

from core.config import COUNTRIES
from actors.models import Actor,ActorCampaignEmailStatistics
from control.models import Account
from control.models import ActorBoughtLead
from control.models import RecentlyviewLeads,Subscription
from commerce.models import Invoice, Trade , Basket
from leads.models import Lead
from worker.models import WorkerNoticeEmailTask
from worker.models import WorkerNoticeMatchedFilter
from utils import get_paginator_obj

per_page = 10

@staff_member_required
def actor_card(request, qs_only=False):
    """ Get actor's card
    """
    actors = search_actor(request, True)
    card_dict = actor_basic(request, actors, True)
    card_dict.update({'actors': actors})
    return render_to_response('card/actor.html', card_dict,
        context_instance=RequestContext(request))

@staff_member_required
def search_actor(request, qs_only=False):
    """ Fetch actors by search keyword from actor model
    """
    query = request.POST.get('search_actor', '')
    request.session['search_term'] = query
    no_match = None
    if query:
        q_fields = [
                'first_name', 'last_name', 'email', 'phone_number',
                'skype', 'actor_key', 'address__city', 'address__state', 
                'address__region', 'company__name', 
            ]
        q_or = reduce(operator.__or__, [Q(**{k+'__icontains': query}) for k in q_fields])        
        if query.isdigit():
            q_or |= Q(id=query)
        
        country_code = [c for c, n in COUNTRIES if c and query in n.lower()]
        if country_code:
            q_or |= Q(address__country=country_code[0])

        actors = Actor.objects.filter(q_or)
        if len(actors) == 0:
            no_match = True
    else:
        actors = []

    if qs_only:
        return actors

    return render_to_response('card/actor_list.html', {'actors':actors,'no_match':no_match},
        context_instance=RequestContext(request))

@staff_member_required
def actor_basic(request, actors=None, qs_only=False):
    """ Get actor's basic and company info with admin note
    """
    card_dict = {'error':''}
    if request.method == 'POST':
        actor_id = request.POST.get('filter_actor', 0)

        try:
            if actors:
                actor = actors.get(id=actor_id)
            else:
                actor = Actor.objects.get(id=actor_id)
            account = actor.account_set.latest('pk')
        except Account.DoesNotExist, e:
            card_dict['error'] = 'Account does not exist'
        except Exception, e:
            card_dict['error'] = 'Actor does not exist'
        else:
            if actor.invoiceapplication_set.exists():
                actor_invoice = actor.invoiceapplication_set.latest('pk')
            else: 
                actor_invoice = None
#            notes = actor.note_set.values_list('admin_note', flat=True).order_by('-id')
#            notes = '\n'.join(notes)
            notes_obj = actor.note_set.order_by('-id')
            notes =''
            for nt in notes_obj:                
                notes += nt.admin_note
                notes += "\n"
                if nt.created:
                    notes += "*** "+ nt.created.strftime("%d %b %Y %I:%M:%S %p") + " by " + nt.admin_note_user + " ***"
                notes += "\n"
                notes += "****************************************************"
                notes += "\n"
            
            orders, ntxn = get_transactions(request, actor, True)
            boughts = get_boughtlead(request, actor,None,True)
            viewedleads = get_viewedlead(request, actor, True)
            latestsearches = get_latestsearch(request, actor, True)
            invoices = get_invoices(request, actor, True)
            subscriptions = get_subscriptions(request, actor, True)
            bids = get_bids(request, actor, True)
            filters, nfilter = get_leadfilter(request, actor, True)
            notice_emails, nemail = get_notice_emails(request, actor, True)
            customer_rank = get_customer_rank(request, actor, True)
            customer_value = get_customer_value(request, actor, True)
            
            card_dict = {
                'actor': actor, 'account': account, 
                'actor_invoice': actor_invoice, 'orders': orders, 
                'order_count': ntxn, 'boughts': boughts,
                'viewedleads': viewedleads, 'latestsearches': latestsearches,
                'filters': filters, 'notice_emails': notice_emails,
                'email_count': nemail, 'notes': notes, 'bids': bids,
                'invoices': invoices, 'subscriptions': subscriptions,
                'customer_rank': customer_rank,
                'customer_value': customer_value,
            }
    
    if qs_only:
        return card_dict
    
    return render_to_response('card/actor_basic.html', card_dict,
        context_instance=RequestContext(request))

@staff_member_required
def get_transactions(request, actor=None, qs_only=False):
    """ Get actor's transactions with type filter
    """
    if actor is None:
        actor_id = request.POST.get('filter_actor', 0)
        try:
            actor = Actor.objects.get(id=actor_id)
        except Exception, e:
            actor = None
    
    if actor:
        orders = actor.transaction_set.all().order_by('-transaction_date')
        ntxn = orders.filter(transaction_type='order').count()
        txn_type = request.POST.get('txn_type', '').strip()
        if txn_type:
            orders = orders.filter(transaction_type__iexact=txn_type)   
    else:
        orders = []
    
    page = request.POST.get('page')
    orders = get_paginator_obj(orders, page, per_page)
    
    if qs_only:
        return orders, ntxn

    return render_to_response('card/orders.html', {
            'orders': orders, 'txn_type': txn_type,
        },context_instance=RequestContext(request))

@staff_member_required
def get_boughtlead(request, actor=None,lead = None, qs_only=False):
    """ Get actor's bought lead
    """
    if actor is None:
        actor_id = request.POST.get('filter_actor', 0)
        try:
            actor = Actor.objects.get(id=actor_id)
        except Exception, e:
            actor = None
    
    if actor:
        boughts = actor.actorboughtlead_set.all().order_by('-id')
    else:
        boughts = []
        
    if lead:
         boughts = lead.actorboughtlead_set.all().order_by('-id')
        
    
    page = request.POST.get('page')
    boughts = get_paginator_obj(boughts, page, per_page)
    
    if qs_only:
        return boughts

    return render_to_response('card/boughts.html', {
            'boughts': boughts,
        },context_instance=RequestContext(request))

@staff_member_required
def get_viewedlead(request, actor=None, qs_only=False):
    """ Get actor's latest viewed lead
    """
    if actor is None:
        actor_id = request.POST.get('filter_actor', 0)
        try:
            actor = Actor.objects.get(id=actor_id)
        except Exception, e:
            actor = None
    
    if actor:
        viewedleads = RecentlyviewLeads.objects.filter(user=actor).order_by('-modified')
        if len(viewedleads) > 0 :
            viewedleads = viewedleads[:50]
    else:
        viewedleads = []
    
    page = request.POST.get('page')
    viewedleads = get_paginator_obj(viewedleads, page, per_page)
    
    if qs_only:
        return viewedleads

    return render_to_response('card/viewedleads.html', {
            'viewedleads': viewedleads,
        },context_instance=RequestContext(request))

@staff_member_required
def get_latestsearch(request, actor=None, qs_only=False):
    """ Get actor's latest viewed lead
    """
    if actor is None:
        actor_id = request.POST.get('filter_actor', 0)
        try:
            actor = Actor.objects.get(id=actor_id)
        except Exception, e:
            actor = None
    
    if actor:
        latestsearches = actor.recentlysearch_set.all().order_by('-id')
        if len(latestsearches) > 0 :
            latestsearches = latestsearches[:50]
    else:
        latestsearches = []
    
    page = request.POST.get('page')
    latestsearches = get_paginator_obj(latestsearches, page, per_page)
    
    if qs_only:
        return latestsearches

    return render_to_response('card/latestsearches.html', {
            'latestsearches': latestsearches,
        },context_instance=RequestContext(request))

@staff_member_required
def get_invoices(request, actor=None, qs_only=False):
    """ Get actor's invoices with type filter
    """
    if actor is None:
        actor_id = request.POST.get('filter_actor', 0)
        try:
            actor = Actor.objects.get(id=actor_id)
        except Exception, e:
            actor = None
    
    if actor:
        invoices = actor.invoice_actor.order_by('-id')
    else:
        invoices = []
    
    page = request.POST.get('page')
    invoices = get_paginator_obj(invoices, page, per_page)
    
    if qs_only:
        return invoices

    return render_to_response('card/invoices.html', {
            'invoices': invoices, 
        },context_instance=RequestContext(request))

@staff_member_required
def get_subscriptions(request, actor=None, qs_only=False):
    """ Get actor's subscriptions with type filter
    """
    if actor is None:
        actor_id = request.POST.get('filter_actor', 0)
        try:
            actor = Actor.objects.get(id=actor_id)
        except Exception, e:
            actor = None
    
    if actor:
        subscriptions = actor.subscription_set.all().order_by('-id')
        if len(subscriptions) > 0 :
            subscriptions = subscriptions[:50]
    else:
        subscriptions = []
    
    page = request.POST.get('page')
    subscriptions = get_paginator_obj(subscriptions, page, per_page)
    
    if qs_only:
        return subscriptions

    return render_to_response('card/subscriptions.html', {
            'subscriptions': subscriptions, 
        },context_instance=RequestContext(request))

@staff_member_required
def get_bids(request, actor=None, qs_only=False):
    """ Get actor's bid with type filter
    """
    if actor is None:
        actor_id = request.POST.get('filter_actor', 0)
        try:
            actor = Actor.objects.get(id=actor_id)
        except Exception, e:
            actor = None
    
    if actor:
        bids = actor.bid_set.all().order_by('-id')
        if len(bids) > 0 :
            bids = bids[:50]
    else:
        bids = []
    
    page = request.POST.get('page')
    bids = get_paginator_obj(bids, page, per_page)
    
    if qs_only:
        return bids

    return render_to_response('card/bids.html', {
            'bids': bids, 
        },context_instance=RequestContext(request))

@staff_member_required
def get_leadfilter(request, actor=None, qs_only=False):
    """ Get actor's lead filter
    """
    if actor is None:
        actor_id = request.POST.get('filter_actor', 0)
        try:
            actor = Actor.objects.get(id=actor_id)
        except Exception, e:
            actor = None
    
    if actor:
        filters = actor.leadfilter_set.all().order_by('-created')
        nfilter = filters.count()
    else:
        filters = []
    
    page = request.POST.get('page')
    filters = get_paginator_obj(filters, page, per_page)

    if qs_only:
        return filters, nfilter

    return render_to_response('card/filters.html', {
            'filters': filters,
        }, context_instance=RequestContext(request))

@staff_member_required
def get_notice_emails(request, actor=None, qs_only=False):
    """ Get notice emails sent to actor
    """
    if actor is None:
        actor_id = request.POST.get('filter_actor', 0)
        try:
            actor = Actor.objects.get(id=actor_id)
        except Exception, e:
            actor = None
    
    if actor:        
        notice_emails = actor.workernoticematchedfilter_set.all().order_by('-completed')
        nemail = notice_emails.count()
    else:
        notice_emails = []
    
    for ne in notice_emails:
        lead = ne.ntask.lead
        ne.bought = actor.actorboughtlead_set.filter(lead=lead).exists()
    
    page = request.POST.get('page')
    notice_emails = get_paginator_obj(notice_emails, page, per_page)

    if qs_only:
        return notice_emails, nemail

    return render_to_response('card/notice.html', {
            'notice_emails': notice_emails, 
        }, context_instance=RequestContext(request))

# The below function is copy paste from KPI by Ramu on 07/Apr/2014.
# Only difference is parameter passed and NO filter from/to date.
# Need to write this function in common place and call it in both the place
@staff_member_required 
def get_customer_rank(request, actor=None, qs_only=False):
    """ Customer Rank indicate how much a customer buy
    """
    actorid = actor.id
    # actorid = request.POST.get('filter_actor', 0)
    # filter_from_date = request.POST.get('filter_from_date')
    # filter_to_date = request.POST.get('filter_to_date')

    # from_date = convert_str_to_datetime(filter_from_date)
    # to_date = convert_str_to_datetime(filter_to_date, 1)

    if actorid:
        actorid = long(actorid)
        wnet = WorkerNoticeMatchedFilter.objects.filter(actor__id=actorid)
        lead_bought = ActorBoughtLead.objects.filter(actor__id=actorid)
    # elif from_date or to_date:
    #     wnet = WorkerNoticeMatchedFilter.objects.all()
    #     lead_bought = ActorBoughtLead.objects.all()
    # else:
    #     wnet = WorkerNoticeMatchedFilter.objects.none()
    #     lead_bought = ActorBoughtLead.objects.none()

    # if from_date:
    #     wnet = wnet.filter(completed__gt=from_date)
    #     lead_bought = lead_bought.filter(created__gt=from_date)
    
    # if to_date:
    #     wnet = wnet.filter(completed__lt=to_date)
    #     lead_bought = lead_bought.filter(created__lt=to_date)
    
    nlead_bought = lead_bought.count()
    nemail = wnet.count()
    if nlead_bought and nemail:
        customer_rank_percentage = float(nlead_bought) / float(nemail) * 100.0
    else:
        customer_rank_percentage = 0

    if qs_only:
        return customer_rank_percentage

    extra_actors = Actor.objects.all()

    indicator = 'cr'
    template = 'report/kpi/kpi.html'
    temp_dict = {
        'indicator_id': indicator, 'indicator': 'customer rank', 'ndigits': 1,
        'f1_title': 'Leads bought', 'f2_title': 'Notice e-mail send',
        'indicator_description': 'Customer Rank indicate how much a customer buy',
        'factor1': nlead_bought, 'factor2': nemail, 'indicator_value': customer_rank_percentage,
        'indicator_symbol': '%', 'indicator_format': 'percentage', 
        'extra_actors': extra_actors, 'filter_actor': actorid,
        'filter_from_date': filter_from_date, 'filter_to_date': filter_to_date,
    }
    if request.POST.get('indicator') == indicator:
        template = 'report/kpi/customer_rank_list.html'
        extra_dict = {'worker_notice': wnet, 'lead_bought': lead_bought, }
        temp_dict.update(extra_dict)

    return render_to_response(template, temp_dict, context_instance=RequestContext(request))

@staff_member_required
# The below function is copy paste from KPI by Ramu on 07/Apr/2014.
# Only difference is parameter passed; NO filter from/to date; included count, sum, avg at top
# Need to write this function in common place and call it in both the place
def get_customer_value(request, actor=None, qs_only=False):
    """ Customer Value tells us how much a customer can buy
    """
    actorid = actor.id
    # actorid = request.POST.get('filter_actor', 0)
    # filter_from_date = request.POST.get('filter_from_date')
    # filter_to_date = request.POST.get('filter_to_date')

    # from_date = convert_str_to_datetime(filter_from_date)
    # to_date = convert_str_to_datetime(filter_to_date, 1)

    if actorid:
        actorid = long(actorid)
        wnet = WorkerNoticeMatchedFilter.objects.filter(actor__id=actorid)
    # elif from_date or to_date:
    #     wnet = WorkerNoticeMatchedFilter.objects.all()
    # else:
    #     wnet = WorkerNoticeMatchedFilter.objects.none()

    # if from_date:
    #     wnet = wnet.filter(completed__gt=from_date)
    
    # if to_date:
    #     wnet = wnet.filter(completed__lt=to_date)    
    nlead_price = wnet.aggregate(lp=Sum('ntask__lead__price'))['lp']
    if not nlead_price: nlead_price = 0
    nemail = wnet.count()
    customer_value_v = nlead_price
    
    if qs_only:
        return customer_value_v

    extra_actors = Actor.objects.all()

    indicator = 'cv'
    template = 'report/kpi/kpi.html'
    temp_dict = {
        'indicator_id': indicator, 'indicator': 'customer value', 'ndigits': 0,
        'f1_title': 'Notice E-mail', 'f2_title': 'Lead Price',
        'indicator_description': 'Customer Value tells us how much a customer can buy',
        'factor1': nemail, 'factor2': nlead_price, 'indicator_value': customer_value_v,
        'indicator_symbol': ' SEK', 'indicator_format': 'value', 
        'extra_actors': extra_actors, 'filter_actor': actorid,
        'filter_from_date': filter_from_date, 'filter_to_date': filter_to_date,
    }
    if request.POST.get('indicator') == indicator:
        template = 'report/kpi/customer_value_list.html'
        extra_dict = {'worker_notice': wnet,}
        temp_dict.update(extra_dict)

    return render_to_response(template, temp_dict, context_instance=RequestContext(request))

@staff_member_required
def lead_card(request, qs_only=False):
    """ Get leads's card
    """
    leads = search_lead(request, True)
    lead_dict = lead_basic(request, leads, True)
    lead_dict = {}
    lead_dict.update({'leads': leads})
    return render_to_response('card/lead.html', lead_dict,
        context_instance=RequestContext(request))

@staff_member_required
def search_lead(request, qs_only=False):
    """ Fetch leads by search keyword from lead model
    """
    query = request.POST.get('search_lead', '')
    try:
        request.session['search_lead'] = query
        no_match = None
        if query:
            #q_fields = [
                    #'title', 'description', 'price', 'base_price',
                    #'base_currency', 'price_currency', 'category__name',
                    #'seller', 'active','sale', 
                #]
            q_fields = [
                    'title', 'description', 'price', 'base_price',
                    'base_currency', 'price_currency', 'category__name',
                    'seller__username', 'active','sale', 
                ]    
            q_or = reduce(operator.__or__, [Q(**{k+'__icontains': query}) for k in q_fields])        
            if query.isdigit():
                q_or |= Q(id=query)
            
            #country_code = [c for c, n in COUNTRIES if c and query in n.lower()]
            #if country_code:
            #    q_or |= Q(address__country=country_code[0])
    
            leads = Lead.objects.filter(q_or)
            if len(leads) == 0:
                no_match = True
        else:
            leads = []
    
        if qs_only:
            return leads
    except:
        import traceback
        traceback.print_exc()

    return render_to_response('card/lead_list.html', {'leads':leads,'no_match':no_match},
        context_instance=RequestContext(request))



@staff_member_required
def lead_basic(request, leads=None, qs_only=False):
    """ Get actor's basic and company info with admin note
    """
    lead_dict = {'error':''}
    if request.method == 'POST':
        lead_id = request.POST.get('filter_lead', 0)
        try:
            if leads:
                lead = leads.get(id=lead_id)
            else:
                lead = Lead.objects.get(id=lead_id)
            #account = actor.account_set.latest('pk')
        except e:
            print e
            lead_dict['error'] = 'Account does not exist'
        except Exception, e:
            print e
            lead_dict['error'] = 'Lead does not exist'
        else:
            #if actor.invoiceapplication_set.exists():
            #    actor_invoice = actor.invoiceapplication_set.latest('pk')
            #else: 
            #    actor_invoice = None
            #notes = actor.note_set.values_list('admin_note', flat=True)
            #notes = '\n'.join(notes)
            
            lead_bids = get_lead_bids(request, lead, True)
            orders = get_lead_transactions(request, lead, True)
            trades = get_lead_trades(request, lead, True)
            boughts = get_boughtlead(request, None,lead, True)
            viewedusers = get_viewedlead_user(request, lead, True)
            subscriptions = get_lead_subscriptions(request, lead, True)
            notice_emails, nemail = get_lead_notice_emails(request, lead, True)
            lead_basket = get_lead_basket(request, lead, True)
            lead_auction = get_lead_auction(request,lead,True)
            campaign_statistics = get_campaign_statistics(request,lead,True)
            #boughts = get_boughtlead(request, actor, True)
            #viewedleads = get_viewedlead(request, actor, True)
            #latestsearches = get_latestsearch(request, actor, True)
            #invoices = get_invoices(request, actor, True)
            #subscriptions = get_subscriptions(request, actor, True)
            #bids = get_bids(request, actor, True)
            #filters, nfilter = get_leadfilter(request, actor, True)
            #notice_emails, nemail = get_notice_emails(request, actor, True)
            #customer_rank = get_customer_rank(request, actor, True)
            #customer_value = get_customer_value(request, actor, True)
            lead_dict = {
                'lead': lead, 'account': None, 
                'actor_invoice': None,
                'orders': orders,'bids':lead_bids,
                'trades':trades,'boughts':boughts,
                'viewedusers':viewedusers,'subscriptions':subscriptions,
                'notice_emails':notice_emails,'lead_basket':lead_basket,
                'lead_auction':lead_auction,'campaign_statistics':campaign_statistics, 'nemail':nemail,
                
            }
    
    if qs_only:
        return lead_dict
    
    return render_to_response('card/lead_basic.html', lead_dict,
        context_instance=RequestContext(request))


@staff_member_required
def get_lead_transactions(request, lead=None, qs_only=False):
    """ Get actor's transactions with type filter
    """
    if lead is None:
        lead_id = request.POST.get('filter_lead', 0)
        try:
            lead = Actor.objects.get(id=lead_id)
        except Exception, e:
            lead = None
    
    if lead:
        orderline = lead.orderline_set.all()
        orders = []
        for i in orderline:
            orders.append(i.order.transaction_set.all())
        orders = [item for sublist in orders for item in sublist]
        #ntxn = orders.filter(transaction_type='order').count()
        txn_type = request.POST.get('txn_type', '').strip()
        if txn_type:
            orders = orders.filter(transaction_type__iexact=txn_type)   
    else:
        orders = []
    page = request.POST.get('page')
    orders = get_paginator_obj(orders, page, per_page)
    
    if qs_only:
        return orders

    return render_to_response('card/leadorders.html', {
            'orders': orders, 'txn_type': txn_type,
        },context_instance=RequestContext(request))

@staff_member_required
def get_lead_bids(request, lead=None, qs_only=False):
    """ Get leads's bid with type filter
    """
    if lead is None:
        lead_id = request.POST.get('filter_lead', 0)
        try:
            lead = Lead.objects.get(id=actor_id)
        except Exception, e:
            lead = None
    
    if lead:
        bids = lead.bid_set.all().order_by('-id')
        if len(bids) > 0 :
            bids = bids[:50]
    else:
        bids = []
    
    page = request.POST.get('page')
    bids = get_paginator_obj(bids, page, per_page)
    
    if qs_only:
        return bids

    return render_to_response('card/leadbids.html', {
            'bids': bids, 
        },context_instance=RequestContext(request))

@staff_member_required
def get_lead_trades(request, lead=None, qs_only=False):
    """ Get leads's trade
    """
    if lead is None:
        lead_id = request.POST.get('filter_lead', 0)
        try:
            lead = Lead.objects.get(id=actor_id)
        except Exception, e:
            lead = None
    
    if lead:
        trades = lead.trade_set.all().order_by('-id')
        if len(trades) > 0 :
            trades = trades[:50]
    else:
        trades = []
    
    page = request.POST.get('page')
    trades = get_paginator_obj(trades, page, per_page)
    
    if qs_only:
        return trades

    return render_to_response('card/leadtrades.html', {
            'trades': trades, 
        },context_instance=RequestContext(request))

@staff_member_required
def get_viewedlead_user(request, lead=None, qs_only=False):
    """ Get leads's  viewed users
    """
    if lead is None:
        lead_id = request.POST.get('filter_lead', 0)
        try:
            lead = Lead.objects.get(id=lead_id)
        except Exception, e:
            lead = None
    
    if lead:
        viewedusers = RecentlyviewLeads.objects.filter(lead=lead.id).order_by('-modified')
        if len(viewedusers) > 0 :
            viewedusers = viewedusers[:50]
    else:
        viewedusers = []
    
    page = request.POST.get('page')
    viewedusers = get_paginator_obj(viewedusers, page, per_page)
    
    if qs_only:
        return viewedusers

    return render_to_response('card/viewedleads_user.html', {
            'viewedusers': viewedusers,
        },context_instance=RequestContext(request))


@staff_member_required
def get_lead_subscriptions(request, lead=None, qs_only=False):
    """ Get leads's  subscription
    """
    if lead is None:
        lead_id = request.POST.get('filter_lead', 0)
        try:
            lead = Lead.objects.get(id=lead_id)
        except Exception, e:
            lead = None
    
    if lead:
        bid_obj = lead.bid_set.all()
        subscription_id = [i.subscription_id for i in bid_obj if i.subscription_id]
        subscriptions = Subscription.objects.filter(id__in = subscription_id )
    else:
        subscriptions = []
    
    page = request.POST.get('page')
    subscriptions = get_paginator_obj(subscriptions, page, per_page)
    
    if qs_only:
        return subscriptions

    return render_to_response('card/lead_subscriptions.html', {
            'subscriptions': subscriptions,
        },context_instance=RequestContext(request))


@staff_member_required
def get_lead_notice_emails(request, lead=None, qs_only=False):
    """ Get notice emails sent to actor
    """
    if lead is None:
        actor_id = request.POST.get('filter_lead', 0)
        try:
            lead = Lead.objects.get(id=actor_id)
        except Exception, e:
            lead = None
    
    if lead:        
        lead_notice_emails = [i.id for i in lead.workernoticeemailtask_set.all()]
        notice_emails = WorkerNoticeMatchedFilter.objects.filter(ntask_id__in = lead_notice_emails)
        nemail = notice_emails.count()
    else:
        notice_emails = []
    
    for ne in notice_emails:
        lead = ne.ntask.lead
        ne.bought = lead.actorboughtlead_set.filter(lead=lead).exists()
    
    page = request.POST.get('page')
    notice_emails = get_paginator_obj(notice_emails, page, per_page)

    if qs_only:
        return notice_emails, nemail

    return render_to_response('card/notice.html', {
            'notice_emails': notice_emails, 
        }, context_instance=RequestContext(request))

@staff_member_required
def get_lead_basket(request, lead=None, qs_only=False):
    """ Get leads's  basket
    """
    if lead is None:
        lead_id = request.POST.get('filter_lead', 0)
        try:
            lead = Lead.objects.get(id=lead_id)
        except Exception, e:
            lead = None
    
    if lead:
        basket_obj = lead.basketline_set.all()
        basket_id = [i.basket.id for i in basket_obj if i.basket]
        lead_basket = Basket.objects.filter(id__in = basket_id )
    else:
        lead_basket = []
    
    page = request.POST.get('page')
    lead_basket = get_paginator_obj(lead_basket, page, per_page)
    
    if qs_only:
        return lead_basket

    return render_to_response('card/lead_basket.html', {
            'lead_basket': lead_basket,
        },context_instance=RequestContext(request))


@staff_member_required
def get_lead_auction(request, lead=None, qs_only=False):
    """ Get leads's  auction
    """
    if lead is None:
        lead_id = request.POST.get('filter_lead', 0)
        try:
            lead = Lead.objects.get(id=lead_id)
        except Exception, e:
            lead = None
    try:
        lead.auction
        auction = lead
    except:
        auction = False
    
    if qs_only:
        return auction

    return render_to_response('card/lead_auction.html', {
            'lead_auction': lead,
            'auction':auction,
        },context_instance=RequestContext(request))

@staff_member_required
def get_campaign_statistics(request, lead=None, qs_only=False):
    if lead is None:
        lead_id = request.POST.get('filter_lead', 0)
        try:
            lead = Lead.objects.get(id=lead_id)
        except Exception, e:
            lead = None
    try:
        actor_id = lead.seller.id
        campaign_statistics = ActorCampaignEmailStatistics.objects.filter(leadseller_actor_id=actor_id)
    except:
        import traceback
        traceback.print_exc()
        campaign_statistics = []
    
    page = request.POST.get('page')
    campaign_statistics = get_paginator_obj(campaign_statistics, page, per_page)
    if qs_only:
        return campaign_statistics

    return render_to_response('card/campaign_statistics.html', {
            'campaign_statistics':campaign_statistics,
        },context_instance=RequestContext(request))

