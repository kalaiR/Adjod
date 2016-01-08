#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.http import HttpResponse, HttpResponseRedirect
from django.views.decorators.http import require_POST
from paypal.standard.ipn.forms import PayPalIPNForm
from paypal.standard.ipn.models import PayPalIPN
from django.views.decorators.csrf import csrf_protect, csrf_exempt
from paypal.standard.models import ST_PP_COMPLETED
from paypal.standard.ipn.signals import payment_was_successful
from adjod.models import UserProfile

from django.contrib.sites.models import Site
from advertisement.models import PremiumPriceInfo, Product
from adjod.util import currency_of_country
from django.conf import settings
from django.template import RequestContext
from django.shortcuts import render_to_response, render
from django.db import transaction
from commerce.models import *

def show_me_the_money(sender, **kwargs):
	print "show_me_the_money"
	ipn_obj = sender
	if ipn_obj.payment_status == ST_PP_COMPLETED:
		# Undertake some action depending upon `ipn_obj`.
		if ipn_obj.custom == "Upgrade all users!":
			Users.objects.update(paid=True)
payment_was_successful.connect(show_me_the_money)

def store_transaction(request,ipn_obj):
	if request.COOKIES.get('product_id'):
		if Product.objects.filter(id=request.COOKIES.get('product_id')).exists():
			product = Product.objects.get(id=request.COOKIES.get('product_id'))
			if ipn_obj.payment_status == "Pending":
				print "pending"
				product.delete()
			else:
				if product.premium_plan.purpose == "urgent_subscription" or product.premium_plan.purpose == "top_subscription" or product.premium_plan.purpose == "urgent_top_subscription":
					order = Order()
					order.product = product
					order.subscription_plan = PremiumPriceInfo.objects.get(id=product.premium_plan.id)
					order.save()
				transaction =  Transaction()
				transaction.userprofile = UserProfile.objects.get(id=request.user.id)
				transaction.transaction_mode = "online"
				transaction.amount = ipn_obj.mc_gross
				transaction.transaction_type = product.premium_plan.purpose
				transaction.order = order
				transaction.paypal = ipn_obj
				transaction.payment_status = ipn_obj.payment_status
				transaction.save()
	if request.COOKIES.get('transaction_type') and request.COOKIES.get('transaction_type') == "Account Subscription":
			premium_plan = PremiumPriceInfo.objects.get(purpose="account_subscription")
			order = Order()
			order.subscription_plan = PremiumPriceInfo.objects.get(id=premium_plan.id)
			order.save()
			transaction =  Transaction()
			transaction.userprofile = UserProfile.objects.get(id=request.user.id)
			transaction.transaction_mode = "online"
			transaction.amount = ipn_obj.mc_gross
			transaction.transaction_type = premium_plan.purpose
			transaction.order = order
			transaction.paypal = ipn_obj
			transaction.payment_status = ipn_obj.payment_status
			transaction.save()
	return




@transaction.commit_on_success
@csrf_exempt
@require_POST
def ipn(request, item_check_callable=None):
	print "enter ipn"
	"""
	PayPal IPN endpoint (notify_url).
	Used by both PayPal Payments Pro and Payments Standard to confirm transactions.
	http://tinyurl.com/d9vu9d

	PayPal IPN Simulator:
	https://developer.paypal.com/cgi-bin/devscr?cmd=_ipn-link-session
	"""
	flag = None
	ipn_obj = None

	# Clean up the data as PayPal sends some weird values such as "N/A"
	data = request.POST.copy()
	date_fields = ('time_created', 'payment_date', 'next_payment_date', 'subscr_date', 'subscr_effective')
	for date_field in date_fields:
		if data.get(date_field) == 'N/A':
			del data[date_field]

	form = PayPalIPNForm(data)
	if form.is_valid():
		try:
			ipn_obj = form.save(commit=False)
		except Exception, e:
			flag = "Exception while processing. (%s)" % e
	else:
		flag = "Invalid form. (%s)" % form.errors

	if ipn_obj is None:
		ipn_obj = PayPalIPN()

	ipn_obj.initialize(request)
	if flag is not None:
		ipn_obj.set_flag(flag)
	else:
		# Secrets should only be used over SSL.
		if request.is_secure() and 'secret' in request.GET:
			ipn_obj.verify_secret(form, request.GET['secret'])
		else:
			ipn_obj.verify(item_check_callable)
	ipn_obj.user =  UserProfile.objects.get(id=request.user.id)
	ipn_obj.save()
	transaction = store_transaction(request, ipn_obj)
	response = HttpResponseRedirect("/postad/")
	if request.COOKIES.get('product_id'):
		response.delete_cookie('product_id')
	return response

def paypal_transaction(request, product_dict):
	current_site = Site.objects.get_current()
	print "product_dict", product_dict
	plan = PremiumPriceInfo.objects.get(id=product_dict['premium_plan'])
	ctx = { 'business': settings.PAYPAL_RECEIVER_EMAIL,
			'amount': plan.premium_price,
			'item_name': product_dict['title'],
			'notify_url': current_site.domain + settings.PAYPAL_DICT['notify_url'],
			'cancel_return': current_site.domain + settings.PAYPAL_DICT['cancel_return'],
			'return': current_site.domain + settings.PAYPAL_DICT['success_return'],
			'custom':product_dict['you_name'],
			# 'currency_code': plan.base_currency,
			'currency_code': "USD",
			'sandbox_url':settings.SANDBOX_URL
	}
	response = render_to_response('paypal_integration/payment.html', ctx , context_instance=RequestContext(request))
	try:
		product_id = Product.objects.get(title=product_dict['title'],userprofile=UserProfile.objects.get(id=product_dict['userprofile']))
		response.set_cookie("product_id", product_id.id)
	except:
		pass
	return response
