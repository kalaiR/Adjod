
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
from django.core.paginator import Paginator, EmptyPage, InvalidPage

from urlparse import urlparse
from os.path import splitext, basename

def searchnew(request):
    
    return render_to_response('advertisement/search_button.html',context_instance=RequestContext(request)) 

def product_form_v3(request):
    
    return render_to_response('v3/advertisement/quikr_post_v3.html' , context_instance=RequestContext(request))

# def post_ad_v3(request):
#     category=Category.objects.all()

#     ctx={'category':category}
    
#     return render_to_response('v3/advertisement/quikr_post_v3.html' ,ctx, context_instance=RequestContext(request))

def post_ad_v2(request):
    
    return render_to_response('v2/advertisement/quikr_post_v2.html' , context_instance=RequestContext(request))

def ad_detail_v3(request):
    
    return render_to_response('v3/advertisement/ad_detail_v3.html' , context_instance=RequestContext(request))

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

def models_for_brand(request):
    if request.is_ajax() and request.GET and 'brand_id' in request.GET:
        objs1 = Dropdown.objects.filter(brand_refid=request.GET['brand_id']) 
        print objs1
        return JSONResponse([{'id': o1.id, 'name': smart_unicode(o1.model_name)}
            for o1 in objs1])
    else:
        return JSONResponse({'error': 'Not Ajax or no GET'})

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
        
        objs1 = Dropdown.objects.filter(subcat_refid=request.GET['sub_category_id']).exclude(brand_name='')
        for obj in objs1:
            print obj.brand_name

        
        return JSONResponse([{'id': o1.id, 'name': smart_unicode(o1.brand_name)}
            for o1 in objs1])
    else:
        return JSONResponse({'error': 'Not Ajax or no GET'})

def sub_category(request, name=None):
    print name
    category=Category.objects.get(name=name)
    print category.id
    subcategory = SubCategory.objects.filter(category_id=category.id)
    # for subcategory1 in subcategory:
    #     print subcategory1.name
    path=request.path
    print path
    recentad=Product.objects.filter().order_by('-id')[:3]
    ctx = {'subcategory':subcategory,'path':path,'recentad':recentad,'category':category}
    return render_to_response('adjod/userpage.html', ctx , context_instance=RequestContext(request))

# def search(request):
#     print request.GET['q']
#     recentad=Product.objects.filter().order_by('-id')[:3]
    
#     category=Category.objects.all()
    
#     cid=Category.objects.get(name=request.GET['q'])

#     product=Product.objects.filter(category_id=cid)
#     print searchresults
    
#     path=request.path
#     # cquery=request.GET['q']
#     paginator = Paginator(searchresults, 10) # Show 25 contacts per page

    
#     try:
#         page = int(request.GET.get('page', '1'))
#         searchresults = paginator.page(page)
        
#     except(EmptyPage, InvalidPage):
#         page=1
#         # If page is out of range , deliver last page of results.
#         searchresults = paginator.page(paginator.num_pages)
    
#     # ctx = {}
    
#     ctx = {'product':product, 'recentad':recentad, 'path':path,'page':page,'cname':cname,'category':category}

#     return render_to_response('advertisement/search.html',ctx, context_instance=RequestContext(request))

def product_detail(request, pk):
    adinfo=Product.objects.get(pk=int(pk))

    # print adinfo
    # print "adbrand", adinfo.ad_brand
    # print "adtype", adinfo.ad_type_id

    # if adinfo.subcategory_id==1:
    #     ad_type=Dropdown.objects.get(id=adinfo.ad_type_id)

    #     ad_model=Dropdown.objects.get(id=adinfo.ad_model_id)
    #     ctx={'adinfo':adinfo,'ad_type':ad_type,'ad_model':ad_model}
    # if adinfo.subcategory_id==2 or adinfo.subcategory_id==3:
    #     ad_model=Dropdown.objects.get(id=adinfo.ad_model_id)
    #     ctx={'adinfo':adinfo,'ad_model':ad_model}
    
    # if adinfo.subcategory_id==4:
    #     ad_type=Dropdown.objects.get(id=adinfo.ad_type_id)
    #     ctx={'adinfo':adinfo,'ad_type':ad_type}
    # if adinfo.subcategory_id==5:
    #     ad_type=Dropdown.objects.get(id=adinfo.ad_type_id)
    #     ctx={'adinfo':adinfo,'ad_type':ad_type}
    # if adinfo.subcategory_id==6:
    #     ad_type=Dropdown.objects.get(id=adinfo.ad_type_id)
    #     ctx={'adinfo':adinfo,'ad_type':ad_type}
    # if adinfo.subcategory_id==7:
    #     ad_type=Dropdown.objects.get(id=adinfo.ad_type_id)
    #     ctx={'adinfo':adinfo,'ad_type':ad_type}
    # if adinfo.subcategory_id==8:
    #     ad_model=Dropdown.objects.get(id=adinfo.ad_model_id)
    #     ad_os=Dropdown.objects.get(id=adinfo.ad_os_id)
    #     ad_sim=Dropdown.objects.get(id=adinfo.ad_sim_id)
    #     ad_alsoinclude=Dropdown.objects.get(id=adinfo.ad_alsoinclude_id)
    #     ctx={'adinfo':adinfo,'ad_model':ad_model,'ad_os':ad_os,'ad_sim':ad_sim,'ad_alsoinclude':ad_alsoinclude}
    # if adinfo.subcategory_id==9:
    #     ctx={'adinfo':adinfo}
    # if adinfo.subcategory_id==10:
    #     ad_type=Dropdown.objects.get(id=adinfo.ad_type_id)
    #     print ad_type.type_name
    #     ctx={'adinfo':adinfo,'ad_type':ad_type}
 
    results = SearchQuerySet().all()
    sqs = SearchQuerySet().filter(content=adinfo)
    sqsresults = [ r.pk for r in sqs ]
    recommendresults = Product.objects.exclude(pk=int(pk)).filter(pk__in=sqsresults)
    for recommendresult in recommendresults:
        print "searchresults:", recommendresult
    # print "adinfo subcategory id:", adinfo.subcategory_id
    # adinfo_subcategoryid=adinfo.subcategory_id
    # recommendresults=Product.objects.exclude(pk=int(pk)).filter(subcategory_id=adinfo_subcategoryid)[:3]
    # for recommendresult in recommendresults:
    #     print recommendresult
    path=request.path
    print path
    
    recentad=Product.objects.filter().order_by('-id')[:3]
    ctx={'adinfo':adinfo}
    
    return render_to_response('v3/advertisement/ad_detail_v3.html',ctx,context_instance=RequestContext(request))

def product_form(request, name=None, subname=None):

    print request.path 
    userid=request.user.id

    print "userid", userid
    category=Category.objects.all()


    
    
    
    dropdown=Dropdown.objects.all().exclude(year='', color='')

    # dropdown_group=Dropdown.objects.filter(subcat_refid=subcategory.id).exclude(Q(brand_name='') | Q(type_name=''))
    # dropdown_group_brand=Dropdown.objects.filter(subcat_refid=subcategory.id).exclude(brand_name='')
    # dropdown_group_type=Dropdown.objects.filter(subcat_refid=subcategory.id).exclude(type_name='')
    # dropdown_group_os=Dropdown.objects.filter(subcat_refid=subcategory.id).exclude(os='')
    # dropdown_group_sim=Dropdown.objects.filter(subcat_refid=subcategory.id).exclude(sim='')
    # dropdown_group_alsoinclude=Dropdown.objects.filter(subcat_refid=subcategory.id).exclude(alsoinclude='')
    
    city=City.objects.all()
    # locality=Locality.objects.all()
    
    
    # ctx = {'userid':userid,'subcategory':subcategory,'category':category,'city':city,
    #        'locality':locality,'dropdown':dropdown,'dropdown_group_os':dropdown_group_os,'dropdown_group_sim':dropdown_group_sim,
    #        'dropdown_group_alsoinclude':dropdown_group_alsoinclude,'dropdown_group_brand':dropdown_group_brand,'dropdown_group_type':dropdown_group_type}

    ctx = {'userid':userid, 'category':category,'city':city,'dropdown':dropdown}
    return render_to_response('v3/advertisement/quikr_post_v3.html', ctx , context_instance=RequestContext(request))


def product_save(request):
    
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
        product.user_id=request.POST.get('user')
        
        product.category=Category.objects.get(id=request.POST['category_name'])
        print product.category.id
        
        product.subcategory=SubCategory.objects.get(id=request.POST['subcategory_name'])
        print product.subcategory.id

        product.ad_brand=Dropdown.objects.get(id=request.POST['brand_name'])
        print product.ad_brand.id

        product.adtype=request.POST.get('condition')
        product.title=request.POST.get('ad_title')
        product.price=request.POST.get('your_price')
        # product.year=request.POST.get('your_year')
        product.description=request.POST.get('description','')
        product.you_are = request.POST.get('you_are_radio', '')
        product.you_name = request.POST.get('your_name', '')
        product.you_phone = request.POST.get('your_mobile_no', '')   
        

        product.city=City.objects.get(id=request.POST['your_city'])
        product.locality=Locality.objects.get(id=request.POST['your_locality'])

        # product.photos=request.FILES['photos']
        product.photos =request.FILES.getlist('photos[]')
        print product.photos
        
        def handle_uploaded_file(f):
            # product.photos = open('/static/img/photos/%s' % f.name, 'wb+')
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
                photosgroup=photosgroup + settings.STATIC_ROOT + str(uploaded_file)
            else:
                photosgroup=photosgroup + settings.STATIC_ROOT + str(uploaded_file) + ','
        print photosgroup
        
        product.photos=photosgroup
        photo=str(product.photos)
        print photo
        print photo.split(',')
        photos=photo.split(',')
        
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
                    # save it
                    # file_name, file_ext = os.path.splitext(photo.name.rpartition('/')[-1])
                    disassembled = urlparse(photo)
                    filename, file_ext = splitext(basename(disassembled.path))
                    suf = SimpleUploadedFile(filename + file_ext, temp_handle.read(), content_type='image/png')
                    # product.thumbnail.save(filename + '_thumbnail' +'.png', suf, save=False)
                    # print product.thumbnail
                    # if count == 0:
                    # thumbnail_group = thumbnail_group + str(product.thumbnail)
                    # else:
                    # thumbnail_group = thumbnail_group + str(product.thumbnail) + ','
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

        product.created_date   = datetime.datetime.now()
        product.modified_date   = datetime.datetime.now()
        product.save()
    


        success=True
    
    ctx = {'success':success,'emailerror':emailerror}
    return render_to_response('v3/advertisement/quikr_post_v3.html',ctx , context_instance=RequestContext(request))

# def _get_pin(length=5):
#     """ Return a numeric PIN with length digits """
#     return random.sample(range(10**(length-1), 10**length), 1)[0]


# def _verify_pin(mobile_number, pin):
#     """ Verify a PIN is correct """
#     return pin == cache.get(mobile_number)


# def ajax_send_pin(request):
#     """ Sends SMS PIN to the specified number """
#     mobile_number = request.POST.get('mobile_number', "")
#     if not mobile_number:
#         return HttpResponse("No mobile number", mimetype='text/plain', status=403)

#     pin = _get_pin()

#     # store the PIN in the cache for later verification.
#     cache.set(mobile_number, pin, 24*3600) # valid for 24 hrs

#     client = TwilioRestClient(settings.TWILIO_ACCOUNT_SID, settings.TWILIO_AUTH_TOKEN)
#     message = client.messages.create(
#                         body="%s" % pin,
#                         to=mobile_number,
#                         from_=settings.TWILIO_FROM_NUMBER,
#                     )
#     return HttpResponse("Message %s sent" % message.sid, mimetype='text/plain', status=200)

# def process_order(request):
#     """ Process orders made via web form and verified by SMS PIN. """
#     form = OrderForm(request.POST or None)

#     if form.is_valid():
#         pin = int(request.POST.get("pin", "0"))
#         mobile_number = request.POST.get("mobile_number", "")

#         if _verify_pin(mobile_number, pin):
#             form.save()
#             return redirect('transaction_complete')
#         else:
#             messages.error(request, "Invalid PIN!")
#     else:
#         return render(
#                     request,
#                     'order.html',
#                     {
#                         'form': form
#                     }
#                 )

def post_ad1(request):
    category=Category.objects.all()
    ctx={'category':category}
    
    return render_to_response('advertisement/ad1.html',ctx, context_instance=RequestContext(request))

def sample(request):
    advertisement = Product.objects.all()
    print advertisement
    return render_to_response('advertisement/ad1.html',ctx, context_instance=RequestContext(request))   

