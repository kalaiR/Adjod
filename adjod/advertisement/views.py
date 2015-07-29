#User verification and token generation when user login
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.contrib.auth import login, logout
from django.core.context_processors import csrf, request 
from django.views.decorators.csrf import csrf_protect
from django.contrib.auth.tokens import default_token_generator

#Project apps functionalities
from advertisement.models import *
from advertisement.forms import *
from adjod.forms import *
from adjod.models import *
from advertisement.views import *
from advertisement.forms import ProductSearchForm
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
from adjod.util import format_redirect_url

# A couple of request objects - one PJAX, one not.
rf = RequestFactory()
regular_request = rf.get('/')
pjax_request = rf.get('/', HTTP_X_PJAX=True)

#For Currency
from moneyed import Money
from djmoney_rates.utils import convert_money_without_symbol
from djmoney_rates.data import CURRENCIES_BY_COUNTRY_CODE


# def getImages(request): 
#     print "getImages"
#     LAST_INDEX = -1
#     NUMBER_OF_ADS = 1
#     slide_show = SiteBanner.objects.all()
#     print "slide_show", slide_show
#     slide_show_randomIMG = [random.choice(slide_show).banner.name.split(',')[LAST_INDEX] for i in range(NUMBER_OF_ADS)]  
#     print "slide_show_randomIMG", slide_show_randomIMG
#     json = simplejson.dumps(slide_show_randomIMG)
#     return HttpResponse(json, mimetype='application/javascript')

# Definition for view front end design
def product_form_v3(request):
    return render_to_response('v3/advertisement/quikr_post_v3.html' , context_instance=RequestContext(request))

def post_ad_v2(request):
    return render_to_response('v2/advertisement/quikr_post_v2.html' , context_instance=RequestContext(request))

def ad_detail_v3(request):
    return render_to_response('advertisement/ad_detail_v3.html' , context_instance=RequestContext(request))

class JSONResponse(HttpResponse):
    def __init__(self, data):
        super(JSONResponse, self).__init__(
                simplejson.dumps(data), mimetype='application/json')

def getcategorieslist():
    category=Category.objects.all()
    return category

def localities_for_city(request):
    if request.is_ajax() and request.GET and 'city_id' in request.GET:
        print "request.GET['city_id']", request.GET['city_id']
        objs = Locality.objects.filter(city_refid=request.GET['city_id'])
        print objs
        return JSONResponse([{'id': o.id, 'name': smart_unicode(o)}
            for o in objs])
    else:
        return JSONResponse({'error': 'Not Ajax or no GET'})

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
        # objs1 = Dropdown.objects.filter(subcat_refid=request.GET['sub_category_id']).exclude(brand_name='')
        objs1 = Dropdown.objects.filter(subcat__id=request.GET['sub_category_id'])
        for obj in objs1:
            print obj.brand_name        
        return JSONResponse([{'id': o1.id, 'name': smart_unicode(o1.brand_name)}
            for o1 in objs1])
    else:
        return JSONResponse({'error': 'Not Ajax or no GET'})

def sub_category(request, pname=None):
    # print pname
    category=Category.objects.all()
    city=City.objects.all()
    cat=Category.objects.get(name=pname)
    # print cat.id
    subcategory = SubCategory.objects.filter(category_id=cat.id)
    # for subcategory1 in subcategory:
    #     print subcategory1.name
    path=request.path
    # print path
    recentad=Product.objects.filter().order_by('-id')[:3]
    ctx = {'subcategory':subcategory,'path':path,'recentad':recentad,'cat':cat,'category':category,'city':city}
    return render_to_response('adjod/subcategory.html', ctx , context_instance=RequestContext(request))
    
# this is for pjax testing
# @pjax("pjax.html")
def product_detail(request, pk):
    adinfo=Product.objects.get(pk=int(pk))
    large=str(adinfo.photos).split(',')
    largephoto=large[0]
    photos=[n for n in str(adinfo.photos).split(',')]
    # print photos
 
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

    
    path=request.path
    # print path  
    recentad=Product.objects.filter().order_by('-id')[:3]    
    ctx={'adinfo':adinfo,'photos':photos,'largephoto':largephoto,'path':path,'related_product':related_product}  
    return render_to_response('advertisement/ad_detail.html',ctx, context_instance=RequestContext(request))    
    # return TemplateResponse(request, 'advertisement/ad_detail.html', ctx)

@pjax("pjax.html")
def product_form(request, name=None, subname=None):
    print "product_form"
    # print request.path 
    # def product_form_data():
    #     print "product_form_data"
    #     category=Category.objects.all()
    #     # dropdown=Dropdown.objects.all().exclude(year='', color='')
    #     dropdown=Dropdown.objects.all()
    #     # city=City.objects.all()
    #     country=request.COOKIES.get("country")
    #     country=Country.objects.get(code=request.COOKIES.get('country'))
    #     city=City.objects.filter(country_id=country.id)
    #     print city
    #     ctx = {'userid':userid, 'category':category,'city':city,'dropdown':dropdown}
    #     # return render_to_response('advertisement/ad_post.html', ctx , context_instance=RequestContext(request))
    #     return TemplateResponse(request, 'advertisement/ad_post.html', ctx)
    userid=request.user.id
    if request.user.is_authenticated():
            print "authenticate"
            userprofile = UserProfile.objects.get(user_id=userid)
            print "userprofile", userprofile
            if userprofile.ad_count>3:
                print "redirect"
                return HttpResponseRedirect('/')
            else:
                print "enter authenticate else"
                category=Category.objects.all()
                # dropdown=Dropdown.objects.all().exclude(year='', color='')
                dropdown=Dropdown.objects.all()
                # city=City.objects.all()
                country=request.COOKIES.get("country")
                country=Country.objects.get(code=request.COOKIES.get('country'))
                city=City.objects.filter(country_id=country.id)
                print city
                ctx = {'userid':userid, 'category':category,'city':city,'dropdown':dropdown}
                # return render_to_response('advertisement/ad_post.html', ctx , context_instance=RequestContext(request))
                return TemplateResponse(request, 'advertisement/ad_post.html', ctx)
    else:
        print "enter non authenticate else"
        print "enter authenticate else"
        category=Category.objects.all()
        # dropdown=Dropdown.objects.all().exclude(year='', color='')
        dropdown=Dropdown.objects.all()
        # city=City.objects.all()
        country=request.COOKIES.get("country")
        country=Country.objects.get(code=request.COOKIES.get('country'))
        city=City.objects.filter(country_id=country.id)
        print city
        ctx = {'userid':userid, 'category':category,'city':city,'dropdown':dropdown}
        # return render_to_response('advertisement/ad_post.html', ctx , context_instance=RequestContext(request))
        return TemplateResponse(request, 'advertisement/ad_post.html', ctx)

def product_save(request):
    # print "product_save"   
    success=False
    product=Product()
    
    def post_product_save():
        print "request.user", request.user.id
        
        product.category=Category.objects.get(id=request.POST['category_name'])
        # print product.category.id
        
        product.subcategory=SubCategory.objects.get(id=request.POST['subcategory_name'])
        # print product.subcategory.id
    
        product.ad_brand=Dropdown.objects.get(id=request.POST['brand_name'])
        # print product.ad_brand.id
    
        product.adtype=request.POST.get('condition')
        product.title=request.POST.get('ad_title')
        # product.price=request.POST.get('your_price')
    
        price=request.POST.get('your_price')
        country_id=Country.objects.get(code=request.COOKIES.get('country'))
        for key,value in CURRENCIES_BY_COUNTRY_CODE.items():
            if str(key) == str(country_id):
                isocode=value
        current_country = isocode
        print 'current_country', current_country
        base_currency= settings.BASE_CURRENCY
        convert_price = convert_money_without_symbol(float(price),current_country,base_currency)      
        print "convert_price",convert_price
        product.price=convert_price
    
        product.ad_year=request.POST.get('your_year')
        product.description=request.POST.get('description','')
        product.you_are = request.POST.get('you_are_radio', '')
        product.you_name = request.POST.get('your_name', '')
        product.you_phone = request.POST.get('your_mobile_no', '')
    
        product.city=City.objects.get(id=request.POST['your_city'])
        product.locality=Locality.objects.get(id=request.POST['your_locality'])
    
        # product.photos=request.FILES['photos']
        
        #photos
        product.photos =request.FILES.getlist('photos[]')
        # print product.photos       
        
        def handle_uploaded_file(f):
            # product.photos = open('/static/img/photos/%s' % f.name, 'wb+')
            # print "settings.STATIC_ROOT", settings.STATIC_ROOT
            print "f", f
            print "f.name", f.name
            product.photos = open('static/img/photos/%s' % f.name, 'wb+')
            for chunk in f.chunks():
                product.photos.write(chunk)
            product.photos.close()
        photosgroup = ''
        
        count=len(product.photos)
        for uploaded_file in product.photos:
            count=count-1
            handle_uploaded_file(uploaded_file)
            if count==0:
                photosgroup=photosgroup  + 'static/img/photos/' + str(uploaded_file)
            else:
                photosgroup=photosgroup  +  'static/img/photos/' +str(uploaded_file) + ','
        # print photosgroup        
        product.photos=photosgroup
    
        photo=str(product.photos)
        # print photo
        # print photo.split(',')
        photos=photo.split(',')
        # print "photocount", len(photos)
        product.imagecount= len(photos)
        thumbnail_group=''
        if product.photos:
            from PIL import Image as ImageObj
            from cStringIO import StringIO
            from django.core.files.uploadedfile import SimpleUploadedFile
            import os
            try:
                count =len(photos)
                for photo in photos:
                    count=count-1
                    # print "final photo",photo
                    # photo=filename + file_ext
                    # print photo
                    THUMBNAIL_SIZE = (100, 100) # dimensions
                    image = ImageObj.open(photo)
                    # print image
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
        product.thumbnail = thumbnail_group
        if request.FILES.getlist('videos[]'):
            # print "files if part"
            #videos
            product.video =request.FILES.getlist('videos[]')
            # print product.video
    
            def handle_uploaded_file(f):
                # product.photos = open('/static/img/photos/%s' % f.name, 'wb+')
                product.video = open('static/videos/%s' % f.name, 'wb+')
                for chunk in f.chunks():
                    product.video.write(chunk)
                product.video.close()
            videosgroup = ''
            
            count=len(product.video)
            for uploaded_file in product.video:
                count=count-1
                handle_uploaded_file(uploaded_file)
                if count==0:
                    videosgroup=videosgroup + 'static/videos/' + str(uploaded_file)
                else:
                    videosgroup=videosgroup + 'static/videos/' +str(uploaded_file) + ','
            # print videosgroup        
            product.video=videosgroup
        else:
            # print "files else part"
            # print request.POST.get('videos1')
            product.video = request.POST.get('videos1')
            # print product.video
       
        product.created_date  = datetime.datetime.now()
        # product.expired_date = product.created_date + datetime.timedelta(days=30)
        product.modified_date  = datetime.datetime.now()
        product.status_isactive  = True  
        # if request.POST['user_subscription']:
            
        # if product.ispremium == True:
        #     product.premium_plan=PremiumPriceInfo.objects.get(id='1') # here 1 replaced with some other value after paypal has complete
        # else:
        #     product.premium_plan=None
    
        product.country=Country.objects.get(id=1)
        product.save()
        # success=True
    
        # ctx = {'success':success,'emailerror':emailerror}
        # return render_to_response('advertisement/ad_post.html',ctx , context_instance=RequestContext(request))
    
    def success_message():
        post_product_save()
        error['success'] = ugettext('Successfully added post')
        print "error['exit_count']",error['success']
        raise ValidationError(error['success'], 5)

    try:
        error={}
        if request.user.is_authenticated():
            product.userprofile = UserProfile.objects.get(user_id=request.user.id)
            product.isregistered_user = True
            if product.userprofile.ad_count<=3:
                product.userprofile.ad_count+=1
                success_message()
            else:
                print "else authenticate"
                # get_object_or_404('/postad/')
                error['exit_count'] = ugettext('U already post 3 ads....U have to make the account premium')
                print "error['exit_count']",error['exit_count']
                raise ValidationError(error['exit_count'], 6)
        else:
            print "else"
            product.userprofile = None 
            product.expired_date=datetime.datetime.now() + datetime.timedelta(days=10)
            success_message()             
    
    except ValidationError as e:
        messages.add_message(request, messages.ERROR, e.messages[-1]) 
        redirect_path = "/postad/"
        query_string = 'si=%d' % e.code
        redirect_url = format_redirect_url(redirect_path, query_string)
        return HttpResponseRedirect(redirect_url)

def freealert_save(request):
    # print "freealert_save"
    user=request.user.id
    # print "user", user
    freealert=FreeAlert()
    if user:
        userprofile=User.objects.get(id=user)
        # print "userprofile.id", userprofile.id     
        freealert.alert_user=UserProfile.objects.get(user=userprofile.id)
        freealert.alert_category=Category.objects.get(id=request.POST['your_category'])
        freealert.alert_subcategory=SubCategory.objects.get(id=request.POST['your_subcategory'])
        freealert.alert_brand=Dropdown.objects.get(id=request.POST['your_brand'])
        freealert.alert_city=City.objects.get(id=request.POST['your_city'])
        freealert.alert_email = request.POST.get('email')
        freealert.alert_mobile = request.POST.get('mobilenumber')
        freealert.save()
        return HttpResponseRedirect("/?falert=success")
    else:
        # print "else part"
        return HttpResponseRedirect("/?alert=failure")

def freealert(request):
    category = Category.objects.all()
    city=City.objects.all()
    ctx={'category':category, 'city':city}
    return render_to_response('advertisement/ad_freealert.html',ctx,context_instance=RequestContext(request))

def expired_ad_conformation(request):
    # print "expired_ad_conformation"
    ad_id = request.REQUEST['ad_id']
    user_id = request.REQUEST['user_id']
    ad_active = request.REQUEST['ads_active']
    # print ad_id
    # print user_id
    # print ad_active
    user_and_product = Product.objects.get(id=ad_id,userprofile=user_id)
    if ad_active == "active":
        user_and_product.status_isactive= True
    else:
        user_and_product.status_isactive= False
    user_and_product.save()

    return HttpResponseRedirect("/ads/" +ad_id)

