
from advertisement.models import *
from advertisement.forms import *
from adjod.forms import *
from advertisement.views import *
import logging
import pprint
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout
from django.core.context_processors import csrf
from django.core.context_processors import request
from django.views.decorators.csrf import csrf_protect
from django.shortcuts import render_to_response, render
from django.core.urlresolvers import reverse
from django.template import *
from django.contrib.auth import authenticate, login
from django.http import HttpResponseRedirect, HttpResponse
from django import forms
from django.contrib.auth.tokens import default_token_generator
from django.utils.translation import ugettext_lazy as _
from django.utils.translation import ugettext, string_concat
from django import template
from django.core.urlresolvers import reverse
from django.conf import settings
from advertisement.forms import ProductSearchForm
from django.core.files import File
import os
from urllib import unquote, urlencode, unquote_plus
from haystack.inputs import AutoQuery, Exact, Clean
import datetime
from django.utils.encoding import smart_unicode, force_unicode
from django.utils import simplejson
import simplejson as json
from haystack.query import SearchQuerySet
from django.db.models import Q
import simplejson as json
from haystack.query import SearchQuerySet
from urlparse import urlparse
from os.path import splitext, basename
import random
def getImages(request): 
    print "getImages"
    LAST_INDEX = -1
    NUMBER_OF_ADS = 1
    slide_show = SiteBanner.objects.all()
    print "slide_show", slide_show
    slide_show_randomIMG = [random.choice(slide_show).banner.name.split(',')[LAST_INDEX] for i in range(NUMBER_OF_ADS)]  
    print "slide_show_randomIMG", slide_show_randomIMG
    json = simplejson.dumps(slide_show_randomIMG)
    return HttpResponse(json, mimetype='application/javascript')

def product_form_v3(request):
    
    return render_to_response('v3/advertisement/quikr_post_v3.html' , context_instance=RequestContext(request))

def post_ad_v2(request):
    
    return render_to_response('v2/advertisement/quikr_post_v2.html' , context_instance=RequestContext(request))

def ad_detail_v3(request):
    
    return render_to_response('v3/advertisement/ad_detail_v3.html' , context_instance=RequestContext(request))

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
    print "subcategory_for_category"
    if request.is_ajax() and request.GET and 'category_id' in request.GET:
        print request.GET['category_id'] 
        
        objs1 = SubCategory.objects.filter(category_id=request.GET['category_id'])

        
        return JSONResponse([{'id': o1.id, 'name': smart_unicode(o1.name)}
            for o1 in objs1])
    else:
        return JSONResponse({'error': 'Not Ajax or no GET'})

def brand_for_subcategory(request):
    print "brand_for_subcategory"
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
    print pname
    cat=Category.objects.get(name=pname)
    print cat.id
    # if 'q' in request.REQUEST and unicode(request.REQUEST['q']).isdigit():
    #     return AdjodSearchViewCategory()
    subcategory = SubCategory.objects.filter(category_id=cat.id)
    for subcategory1 in subcategory:
        print subcategory1.name
    path=request.path
    print path
    recentad=Product.objects.filter().order_by('-id')[:3]
    ctx = {'subcategory':subcategory,'path':path,'recentad':recentad,'cat':cat}
    return render_to_response('adjod/userpage.html', ctx , context_instance=RequestContext(request))

def product_detail(request, pk):
    adinfo=Product.objects.get(pk=int(pk))
    print 'adinfo.user', adinfo.userprofile

    print "adinfo.photos", adinfo.photos

    related_ads = Product.get_related(adinfo)
    print "related_ads", related_ads

    photosgroup=adinfo.thumbnail
    photo=str(photosgroup)
    print "photo", photo
    print "photosplit", photo.split(',')
    photos=photo.split(',')
    
    large=str(adinfo.photos).split(',')
    largephoto=large[0]
 
    results = SearchQuerySet().all()
    sqs = SearchQuerySet().filter(content=adinfo)
    sqsresults = [ r.pk for r in sqs ]
    recommendresults = Product.objects.exclude(pk=int(pk)).filter(pk__in=sqsresults)
    print recommendresults
    for recommendresult in recommendresults:
        print "searchresults:", recommendresult
    path=request.path
    print path
    recentad=Product.objects.filter().order_by('-id')[:3]
    ctx={'adinfo':adinfo,'photos':photos,'largephoto':largephoto, 'path':path,'recommendresults':recommendresults}
    
    return render_to_response('v3/advertisement/ad_detail_v3.html',ctx,context_instance=RequestContext(request))

def product_form(request, name=None, subname=None):
    print "product_form"
    print request.path 
    userid=request.user.id
    print "userid", userid
    category=Category.objects.all()
    # dropdown=Dropdown.objects.all().exclude(year='', color='')
    dropdown=Dropdown.objects.all()
    city=City.objects.all()
    ctx = {'userid':userid, 'category':category,'city':city,'dropdown':dropdown}
    return render_to_response('v3/advertisement/quikr_post_v3.html', ctx , context_instance=RequestContext(request))

def product_save(request):
    print "product_save"   
    success=False
    product=Product()
    product.you_email = request.POST.get('your_email', '')
    print product.you_email
    productresult=Product.objects.all()
    count=0
    for productresults in productresult:
        if productresults.you_email == product.you_email:
            count=count+1        
    if count >3:
        emailerror=True
        print emailerror
    else:
        emailerror=False
        print emailerror
    
    if emailerror==False:
        # product.user_id=request.POST.get('user')
        print "request.user", request.user.id
        if request.user.is_authenticated():
            product.userprofile = UserProfile.objects.get(user_id=request.user.id)
        else:
            product.userprofile = None 
        
        product.category=Category.objects.get(id=request.POST['category_name'])
        print product.category.id
        
        product.subcategory=SubCategory.objects.get(id=request.POST['subcategory_name'])
        print product.subcategory.id

        product.ad_brand=Dropdown.objects.get(id=request.POST['brand_name'])
        print product.ad_brand.id

        product.adtype=request.POST.get('condition')
        product.title=request.POST.get('ad_title')
        product.price=request.POST.get('your_price')
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
        print product.photos       
        
        def handle_uploaded_file(f):
            # product.photos = open('/static/img/photos/%s' % f.name, 'wb+')
            print "settings.STATIC_ROOT", settings.STATIC_ROOT
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
        print photosgroup        
        product.photos=photosgroup

        photo=str(product.photos)
        print photo
        print photo.split(',')
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
                    print "final photo",photo
                    # photo=filename + file_ext
                    # print photo
                    THUMBNAIL_SIZE = (100, 100) # dimensions
                    image = ImageObj.open(photo)
                    print image
                    # Convert to RGB if necessary
                    if image.mode not in ('L', 'RGB'): image = image.convert('RGB')
                    # create a thumbnail + use antialiasing for a smoother thumbnail
                    image.thumbnail(THUMBNAIL_SIZE, ImageObj.ANTIALIAS)
                    # fetch image into memory
                    temp_handle = StringIO()
                    print "temp", temp_handle
                    image.save(temp_handle, 'png')
                    temp_handle.seek(0)                   
                    disassembled = urlparse(photo)
                    filename, file_ext = splitext(basename(disassembled.path))
                    suf = SimpleUploadedFile(filename + file_ext, temp_handle.read(), content_type='image/png')                    
                    product.thumbnail.save(filename + '_thumbnail' +'.png', suf, save=False)
                    print product.thumbnail
                    if count == 0:
                        thumbnail_group = thumbnail_group + str(product.thumbnail)
                    else:
                        thumbnail_group = thumbnail_group + str(product.thumbnail) + ','
                print thumbnail_group
            except ImportError:
                pass
        product.thumbnail = thumbnail_group
        if request.FILES.getlist('videos[]'):
            print "files if part"
            #videos
            product.video =request.FILES.getlist('videos[]')
            print product.video

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
            print videosgroup        
            product.video=videosgroup
        else:
            print "files else part"
            print request.POST.get('videos1')
            product.video = request.POST.get('videos1')
            print product.video



       
        product.created_date   = datetime.datetime.now()
        product.modified_date   = datetime.datetime.now()
        product.save()
        success=True
    
    ctx = {'success':success,'emailerror':emailerror}
    # return render_to_response('v3/advertisement/quikr_post_v3.html',ctx , context_instance=RequestContext(request))
    if emailerror:
        print "emailerror"
        return HttpResponseRedirect('/postad/?er=emailerror')
        
    else:
        return HttpResponseRedirect('/postad/?su=success')

def freealert_save(request):
    print "freealert_save"
    freealert=FreeAlert()

    freealert.productneed=request.POST.get('productneed')
    print request.POST['locality']
    freealert.locality=Locality.objects.get(id=request.POST['locality'])
    freealert.email=request.POST.get('email')
    freealert.mobilenumber=request.POST.get('mobilenumber')
    freealert.save()
    return HttpResponseRedirect("/?falert=success")


