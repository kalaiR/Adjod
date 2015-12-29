#User verification and token generation when user login
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.contrib.auth import login, logout
from django.core.context_processors import csrf, request
from django.views.decorators.csrf import csrf_protect
from django.contrib.auth.tokens import default_token_generator

#Project apps functionalities
from advertisement.models import *
from adjod.models import *
from advertisement.views import *
from banner.models import *
from djpjax import pjax

#Others
import logging
import pprint
from django.core.urlresolvers import reverse
from django.template import *
from django import template
from django.core.urlresolvers import reverse
from django.conf import settings
from django import forms
from django.core.files import File
import os
from urllib import unquote, urlencode, unquote_plus
from haystack.inputs import AutoQuery, Exact, Clean
import datetime
from haystack.query import SearchQuerySet
from django.db.models import Q
import random
from django.test.client import RequestFactory
from django.views.generic import View

#Different ways of rendering HTML page
from django.shortcuts import render_to_response, render
from django.http import HttpResponseRedirect, HttpResponse
from django.template.response import TemplateResponse

#Language and text Translation
from django.utils.translation import ugettext_lazy as _
from django.utils.translation import ugettext, string_concat
from django.utils.encoding import smart_unicode, force_unicode
from urlparse import urlparse
from os.path import splitext, basename

from django.utils import simplejson
import simplejson as json
from django.core.exceptions import ValidationError
from django.contrib import messages
from adjod.util import *
from paypal.standard.ipn.views import paypal_transaction
from django.db import transaction

# A couple of request objects - one PJAX, one not.
rf = RequestFactory()
regular_request = rf.get('/')
pjax_request = rf.get('/', HTTP_X_PJAX=True)

#For Currency
from moneyed import Money
from djmoney_rates.utils import convert_money_without_symbol
from djmoney_rates.data import CURRENCIES_BY_COUNTRY_CODE

class JSONResponse(HttpResponse):
    def __init__(self, data):
        super(JSONResponse, self).__init__(
                simplejson.dumps(data), mimetype='application/json')


def localities_for_city(request):
    if request.is_ajax() and request.GET and 'city_id' in request.GET:
        print "request.GET['city_id']", request.GET['city_id']
        objs = Locality.objects.filter(city_refid=request.GET['city_id'])
        print objs
        return JSONResponse([{'id': o.id, 'name': smart_unicode(o)}
            for o in objs])
    else:
        return JSONResponse({'error': 'Not Ajax or no GET'})

# Comment this code for future reference
# def models_for_brand(request):
#     if request.is_ajax() and request.GET and 'brand_id' in request.GET:
#         objs1 = Dropdown.objects.filter(brand_refid=request.GET['brand_id'])
#         print objs1
#         return JSONResponse([{'id': o1.id, 'name': smart_unicode(o1.model_name)}
#             for o1 in objs1])
#     else:
#         return JSONResponse({'error': 'Not Ajax or no GET'})


def subcategory_for_category(request):
    # print "subcategory_for_category"
    if request.is_ajax() and request.GET and 'category_id' in request.GET:
        print request.GET['category_id']
        objs1 = SubCategory.objects.filter(category_id=request.GET['category_id'])
        return JSONResponse([{'id': o1.id, 'name': smart_unicode(o1.name)}
            for o1 in objs1])
    else:
        return JSONResponse({'error': 'Not Ajax or no GET'})


def brand_for_subcategory(request):
    # print "brand_for_subcategory"
    if request.is_ajax() and request.GET and 'sub_category_id' in request.GET:
        print request.GET['sub_category_id']
        objs1 = Dropdown.objects.filter(subcat__id=request.GET['sub_category_id'])
        for obj in objs1:
            print obj.brand_name
        return JSONResponse([{'id': o1.id, 'name': smart_unicode(o1.brand_name)}
            for o1 in objs1])
    else:
        return JSONResponse({'error': 'Not Ajax or no GET'})

# Comment this code for future reference
# def sub_category(request, pname=None):
#     cat=Category.objects.get(name=pname)
#     subcategory = SubCategory.objects.filter(category_id=cat.id)
#     ctx = {'subcategory':subcategory,'cat':cat}
#     return render_to_response('adjod/subcategory.html', ctx , context_instance=RequestContext(request))


# this is for pjax testing
# @pjax("pjax.html")
def product_detail(request, pk):
    adinfo=Product.objects.get(pk=int(pk))
    large=str(adinfo.photos).split(',')
    largephoto=large[0]
    photos=[n for n in str(adinfo.photos).split(',')]
    #Comment For Future Reference
    # results = SearchQuerySet().all()
    # sqs = SearchQuerySet().filter(content=adinfo.title)
    # print "sqs",sqs
    # sqsresults = [ r.pk for r in sqs ]
    # print "sqsresults", sqsresults
    # recommendresults = Product.objects.exclude(pk=int(pk)).filter(pk__in=sqsresults)
    # print "recommendresults", recommendresults
    # for recommendresult in recommendresults:
    #     print "searchresults:", recommendresult
    related_product=Product.get_related(adinfo)
    print "related_product", related_product
    ctx={'adinfo':adinfo,'photos':photos,'largephoto':largephoto,'related_product':related_product}
    return render_to_response('advertisement/ad_detail.html',ctx, context_instance=RequestContext(request))
    # return TemplateResponse(request, 'advertisement/ad_detail.html', ctx)

@pjax("pjax.html")
def product_form(request, name=None, subname=None):
    if request.user.is_authenticated():       
        if not request.user.is_superuser:
            userprofile = UserProfile.objects.get(id=request.user.id)
            if userprofile.ad_count>3 and userprofile.is_subscribed == 0:
                return HttpResponseRedirect('/')        
    return TemplateResponse(request, 'advertisement/ad_post.html')

#Fuction for storing in images or vidoes in our folder
def handle_uploaded_file(f):
    file_data = open(settings.MEDIA_ROOT + '/products/' + '%s' % f.name, 'wb+')
    for chunk in f.chunks():
        file_data.write(chunk)
    file_data.close()

def create_path_for_photos_thumbanails(photos, product):
    #Creating path for large photos
    photosgroup = ''
    count=len(photos)
    for uploaded_file in photos:
        count=count-1
        handle_uploaded_file(uploaded_file)
        if count==0:
            photosgroup=photosgroup + 'products/' + str(uploaded_file)
        else:
            photosgroup=photosgroup + 'products/' + str(uploaded_file) + ','
    large_photos=photosgroup

    # Creating path for thumbnail photos
    photo=str(large_photos)
    photos=photo.split(',')
    
    imagecount= len(photos)
    
    thumbnail_group=''
    if large_photos:
        from PIL import Image as ImageObj
        from cStringIO import StringIO
        from django.core.files.uploadedfile import SimpleUploadedFile
        import os
        try:
            count =len(photos)
            for photo in photos:
                count=count-1
                THUMBNAIL_SIZE = (100, 100) # dimensions
                image = ImageObj.open(settings.MEDIA_ROOT + '/' + photo)
                # Convert to RGB if necessary
                if image.mode not in ('L', 'RGB'): image = image.convert('RGB')
                # create a thumbnail + use antialiasing for a smoother thumbnail
                image.thumbnail(THUMBNAIL_SIZE, ImageObj.ANTIALIAS)
                # fetch image into memory
                temp_handle = StringIO()
                # print "temp", temp_handle
                image.save(temp_handle, 'png')
                temp_handle.seek(0)
                disassembled = urlparse(photo)
                filename, file_ext = splitext(basename(disassembled.path))
                suf = SimpleUploadedFile(filename + file_ext, temp_handle.read(), content_type='image/png')
                product.thumbnail.save(filename + '_thumbnail' +'.png', suf, save=False)
                # print product.thumbnail
                if count == 0:
                    thumbnail_group = thumbnail_group + str(product.thumbnail)
                else:
                    thumbnail_group = thumbnail_group + str(product.thumbnail) + ','
            # print thumbnail_group
        except ImportError:
            pass
    thumbnail_photos = thumbnail_group           
    return large_photos, imagecount, thumbnail_photos

#Here Save the post ad after checked the required condition
def post_success(request, product):
    error = {}
    product.category=Category.objects.get(id=request.POST['category_name'])
    product.subcategory=SubCategory.objects.get(id=request.POST['subcategory_name'])
    if request.POST['brand_name']:
        product.ad_brand=Dropdown.objects.get(id=request.POST['brand_name'])
    else:
        product.ad_brand=None   
    # product.adtype=request.POST.get('condition')
    product.adtype= "sell"        
    product.title=request.POST.get('ad_title')
    product.price = currency_conversion(request.POST.get('your_price'),request.COOKIES.get('country_code'))
    product.ad_year=request.POST.get('your_year')
    product.description=request.POST.get('description')
    product.you_are = request.POST.get('you_are_radio')
    product.you_name = request.POST.get('your_name')
    product.you_email = request.POST.get('your_email')
    product.you_phone = request.POST.get('your_mobile_no')
    print "request.POST['your_city']",request.POST['your_city']
    product.city=City.objects.get(id=int(request.POST['your_city']))
    product.locality=Locality.objects.get(id=request.POST['your_locality'])
    product.country_code = request.COOKIES.get("country_code")   
    # product.photos=request.FILES['photos']
    photos =request.FILES.getlist('photos[]')   
    product.photos, product.imagecount, product.thumbnail = create_path_for_photos_thumbanails(photos, product)
    product.video = request.POST.get('video_url')
    product.created_date  = datetime.datetime.now()
    product.modified_date  = datetime.datetime.now()
    product.expired_date=datetime.datetime.now() + datetime.timedelta(days=30)
    product.status_isactive  = True
    product.post_terms=request.POST.get('terms_of_use')
    if request.user.is_authenticated():
        if request.POST.get('premium_plan'):
            plan_price = request.POST["premium_plan"]
            product.premium_plan = PremiumPriceInfo.objects.get(premium_price=plan_price)
            product.ispremium = True
            product_dict = {'userprofile':product.userprofile.id, 'category':product.category, 'subcategory':product.subcategory,
                        'adtype':product.adtype,'title':product.title, 'photos':product.photos,'thumbnail':product.thumbnail,
                        'imagecount':product.imagecount,'video':product.video,'condition':product.condition,'price':product.price,
                        'ad_year':product.ad_year, 'city':product.city, 'locality':product.locality,'country_code':product.country_code,
                        'description':product.description,'you_are':product.you_are, 'you_name':product.you_name,'you_email':product.you_email,
                        'you_phone':product.you_phone,'isregistered_user':product.isregistered_user,'ispremium':product.ispremium,
                        'premium_plan':product.premium_plan,'expired_date':product.expired_date,'status_isactive':product.status_isactive,
                        'post_term_status':product.post_term_status,"premium_plan":product.premium_plan.id}       
            response = product_dict
        else:
            response = None
    else:
        response = None
    product.save()
    return response
    

#Check whether to save the product or not
@transaction.commit_on_success
def product_save(request):
    if request.method == 'POST':
        print "product_save"
        product=Product() 
        try:
            error={}
            if request.user.is_authenticated():
                product.userprofile = UserProfile.objects.get(id=request.user.id)
                product.isregistered_user = True
                if product.userprofile.ad_count<3:
                    product_dict = post_success(request, product) 
                    #Store in Userprofile table to know the status of users post ad counts
                    product.userprofile.ad_count = int(product.userprofile.ad_count) + 1
                    product.userprofile.save() 
                    if product_dict is None:
                        error['success'] = ugettext('Ad Successfully posted')
                        raise ValidationError(error['success'], 5)
                    else: 
                        response = paypal_transaction(request,product_dict)
                        print "after all"
                        return response
                else:
                    # get_object_or_404('/postad/')
                    error['exit_count'] = ugettext('U already post 3 ads....U have to make the account premium')
                    print "error['exit_count']",error['exit_count']
                    raise ValidationError(error['exit_count'], 6)
            else:
                product.userprofile = None
                post_success(request, product)
                error['success'] = ugettext('Ad Successfully posted')
                raise ValidationError(error['success'], 5)

        except ValidationError as e:
            messages.add_message(request, messages.ERROR, e.messages[-1])
            redirect_path = "/postad/"
            query_string = 'pt=%d' % e.code
            redirect_url = format_redirect_url(redirect_path, query_string)
            return HttpResponseRedirect(redirect_url)
    else:
        return HttpResponseRedirect("/postad/")

def freealert_save(request):
    # try:
    error={}
    freealert=FreeAlert()
    if request.user.is_authenticated():
        freealert.alert_user=UserProfile.objects.get(id=request.user.id)
    else:
        freealert.alert_user=None
    freealert.alert_category=Category.objects.get(id=request.POST['your_category'])
    freealert.alert_subcategory=SubCategory.objects.get(id=request.POST['your_subcategory'])
    freealert.alert_brand=Dropdown.objects.get(id=request.POST['your_brand'])
    freealert.alert_city=City.objects.get(id=request.POST['your_city'])
    freealert.alert_email = request.POST.get('email')
    freealert.alert_mobile = request.POST.get('mobilenumber')
    freealert.save()
    return HttpResponseRedirect('/search/?q=&category={}&subcategoryid={}&brandtype={}'.format(request.POST['your_category'] , request.POST['your_subcategory'], request.POST['your_brand']))
    #         error['success'] = ugettext('Free alert created successfully')
    #         print "error['success']",error['success']
    #         raise ValidationError(error['success'], 7)
    #     else:
    #         error['not_an_user'] = ugettext('U are not registered users...First register and then create free alert')
    #         print "error['not_an_user']",error['not_an_user']
    #         raise ValidationError(error['not_an_user'], 8)
    # except ValidationError as e:
        # messages.add_message(request, messages.ERROR, e.messages[-1])
        # redirect_path = "/"
        # query_string = 'fst=%d' % e.code
        # redirect_url = format_redirect_url(redirect_path, query_string)
        # return HttpResponseRedirect(redirect_url)

def expired_ad_conformation(request):
    ad_id = request.REQUEST['ad_id']
    user_id = request.REQUEST['user_id']
    ad_active = request.REQUEST['ads_active']
    user_and_product = Product.objects.get(id=ad_id,userprofile=user_id)
    if ad_active == "active":
        user_and_product.status_isactive= True
    else:
        user_and_product.status_isactive= False
    user_and_product.save()
    return HttpResponseRedirect("/ads/" +ad_id)

@csrf_exempt
def get_user_products(request):
    user_name=request.POST['user_name']
    user_email=request.POST['user_email']
    print "user_name", user_name
    print "user_email", user_email
    # user_id = User.objects.get(username=user_name, email=user_email)
    userprofile_id = UserProfile.objects.get(username=user_name, email=user_email)
    product_id = Product.objects.filter(userprofile=userprofile_id.id)
    product = [productid.id for productid in product_id]
    return JSONResponse(product)
