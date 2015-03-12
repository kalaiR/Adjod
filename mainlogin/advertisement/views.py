# Create your views here.

from advertisement.models import *
from advertisement.forms import *
from mainlogin.forms import *
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
from easy_thumbnails.files import get_thumbnailer
from django.core.files import File
import os
from urllib import unquote, urlencode, unquote_plus
from haystack.inputs import AutoQuery, Exact, Clean
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
import datetime

from django.utils.encoding import smart_unicode
from django.utils import simplejson

import simplejson as json
from haystack.query import SearchQuerySet


class JSONResponse(HttpResponse):
    def __init__(self, data):
        super(JSONResponse, self).__init__(
                simplejson.dumps(data), mimetype='application/json')

def localities_for_city(request):
    if request.is_ajax() and request.GET and 'city_id' in request.GET:
        objs = Locality.objects.filter(city_refid=request.GET['city_id'])
        return JSONResponse([{'id': o.id, 'name': smart_unicode(o)}
            for o in objs])
    else:
        return JSONResponse({'error': 'Not Ajax or no GET'})

def models_for_brand(request):
    if request.is_ajax() and request.GET and 'brand_id' in request.GET:
        objs = Dropdown.objects.filter(brand_refid=request.GET['brand_id'])
        return JSONResponse([{'id': o.id, 'name': smart_unicode(o)}
            for o in objs])
    else:
        return JSONResponse({'error': 'Not Ajax or no GET'})


# from flask import Flask, render_template, request, redirect, url_for, send_from_directory
# from werkzeug import secure_filename

# Initialize the Flask application
# app = Flask(__name__)

# # This is the path to the upload directory
# app.config['UPLOAD_FOLDER'] = settings.STATIC_ROOT
# # These are the extension that we are accepting to be uploaded
# app.config['ALLOWED_EXTENSIONS'] = set(['txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'])

import simplejson as json
from haystack.query import SearchQuerySet


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
    return render_to_response('mainlogin/userpage.html', ctx , context_instance=RequestContext(request))

def search(request):
    recentad=Product.objects.filter().order_by('-id')[:3]
    # form = ProductSearchForm(request.GET)
    # products = form.search()
    # results = [ r.pk for r in products ]
    # docs = Product.objects.filter(pk__in=results)
    # for doc in docs:
    #     print doc
    results = SearchQuerySet().all()

    # sqs1 = SearchQuerySet().filter(content=AutoQuery(request.GET['q']), product_type=Exact('ancient book'))
    
    sqs = SearchQuerySet().filter(content=AutoQuery(request.GET['q']))
    sqsresults = [ r.pk for r in sqs ]
    searchresults = Product.objects.filter(pk__in=sqsresults)
    for searchresult in searchresults:
        print searchresult
    path=request.path
    
    ctx = {'searchresults':searchresults, 'recentad':recentad, 'path':path}
    return render_to_response('advertisement/search.html', ctx , context_instance=RequestContext(request))

def ad_info(request, pk):
    print "adinfo"
    print pk
    adinfo=Product.objects.get(pk=int(pk))

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


    if adinfo.cars_id:

        carresult=Cars.objects.get(id=adinfo.cars_id)
        print "result",carresult.brand_id

        carbrandname = Dropdown_group.objects.get(id=carresult.brand_id)
        print "result1",carbrandname.carbrand

        carmodelname = Dropdown_group.objects.get(id=carresult.model_id)
        print "result2",carmodelname.carmodel

        caryear = Dropdown_group.objects.get(id=carresult.caryear_id)
        print "result3",caryear.year

        color = Dropdown_group.objects.get(id=carresult.carcolor_id)
        print "result3",color.color

        fuel= Dropdown_group.objects.get(id=carresult.carfueltype_id)


        ctx1={'adinfo':adinfo, 'path':path, 'recentad':recentad, 
        'recommendresults':recommendresults,'carresult':carresult,
        'carbrandname':carbrandname,'carmodelname':carmodelname,
        'caryear':caryear,'color':color,'fuel':fuel}


    if adinfo.motorcycle_id:

        motoresult=Motorcycle.objects.get(id=adinfo.motorcycle_id)
        print "result",motoresult.motorcyclebrand_id

        motorbrandname = Dropdown_group.objects.get(id=motoresult.motorcyclebrand_id)
        print "result1",motorbrandname.motorbrand

        motormodelname = Dropdown_group.objects.get(id=motoresult.motorcyclemodel_id)
        print "result2",motormodelname.motormodel

        motoryear = Dropdown_group.objects.get(id=motoresult.year_id)

        ctx1={'adinfo':adinfo, 'path':path, 'recentad':recentad, 
        'recommendresults':recommendresults,'motoresult':motoresult,
        'motorbrandname':motorbrandname,'motormodelname':motormodelname,'motoryear':motoryear}

    if adinfo.scooter_id:

        scooterresult=Scooter.objects.get(id=adinfo.scooter_id)
        

        scooterbrandname = Dropdown_group.objects.get(id=scooterresult.scooterbrand_id)
        print "result1",scooterbrandname.scooterbrand

        scootermodelname = Dropdown_group.objects.get(id=scooterresult.scootermodel_id)
        print "result2",scootermodelname.scootermodel

        scootoryear = Dropdown_group.objects.get(id=scooterresult.year_id)

        ctx1={'adinfo':adinfo, 'path':path, 'recentad':recentad, 
        'recommendresults':recommendresults,'scooterresult':scooterresult,
        'scooterbrandname':scooterbrandname,'scootermodelname':scootermodelname,
        'scootoryear':scootoryear}

    if adinfo.bicycle_id:

        bicycleresult=Bicycle.objects.get(id=adinfo.bicycle_id)

        bicycletype = Dropdown_group.objects.get(id=bicycleresult.bicycletype_id)

        ctx1={'adinfo':adinfo, 'path':path, 'recentad':recentad, 
        'recommendresults':recommendresults,'bicycleresult':bicycleresult,
        'bicycletype':bicycletype}

    if adinfo.sparepart_id:

        sparesult = Sparepart.objects.get(id=adinfo.sparepart_id)

        sparetype = Dropdown_group.objects.get(id=sparesult.spareproducttype_id)

        ctx1={'adinfo':adinfo, 'path':path, 'recentad':recentad, 
        'recommendresults':recommendresults,'sparesult':sparesult,
        'sparetype':sparetype}

    if adinfo.busespart_id:

        busresult = Busespart.objects.get(id=adinfo.busespart_id)

        bustype = Dropdown_group.objects.get(id=busresult.busesvehicletype_id)

        ctx1={'adinfo':adinfo, 'path':path, 'recentad':recentad, 
        'recommendresults':recommendresults,'busresult':busresult,
        'bustype':bustype}

    if adinfo.construction_id:


        constresult=Construction.objects.get(id=adinfo.construction_id)
        constructtype = Dropdown_group.objects.get(id=constresult.constructionvehicletype_id)

        ctx1={'adinfo':adinfo, 'path':path, 'recentad':recentad, 
        'recommendresults':recommendresults,'constresult':constresult,
        'constructtype':constructtype}

    if adinfo.mobile_id:

        mobileresult = Mobiles.objects.get(id=adinfo.mobile_id)

        mobilebrandname = Dropdown_group.objects.get(id=mobileresult.mobilebrandname_id)
        
        mobilemodelname = Dropdown_group.objects.get(id=mobileresult.mobilemodelname_id)
        
        mobileos = Dropdown_group.objects.get(id=mobileresult.mobile_os_id)

        mobilesim = Dropdown_group.objects.get(id=mobileresult.mobile_sim_id)

        mobileinclude= Dropdown_group.objects.get(id=mobileresult.mobile_include_id)


        ctx1={'adinfo':adinfo, 'path':path, 'recentad':recentad, 
        'recommendresults':recommendresults,'mobileresult':mobileresult,
        'mobilebrandname':mobilebrandname,
        'mobilemodelname':mobilemodelname,'mobilesim':mobilesim,
        'mobileos':mobileos,'mobileinclude':mobileinclude}



    if adinfo.tablets_id:

        tabletresult = Tablets.objects.get(id=adinfo.tablets_id)
        
        tabletbrandname = Dropdown_group.objects.get(id=tabletresult.tabletbrandname_id)
        
        ctx1={'adinfo':adinfo, 'path':path, 'recentad':recentad, 
        'recommendresults':recommendresults,'tabletresult':tabletresult,
        'tabletbrandname':tabletbrandname}

    if adinfo.access_id:

        accessresult=Access.objects.get(id=adinfo.access_id)
        

        accesstypename = Dropdown_group.objects.get(id=accessresult.accesstypename_id)
       
        accessbrandname = Dropdown_group.objects.get(id=accessresult.accessbrandname_id)
        

        ctx1={'adinfo':adinfo, 'path':path, 'recentad':recentad, 
        'recommendresults':recommendresults,'accessresult':accessresult,
        'accesstypename':accesstypename,'accessbrandname':accessbrandname}



    # print adinfo.cars_id.brand_id
    # for carinfo in adinfo.cars_id.brand_id:
    #     print carinfo
    # subid = SubCategory.objects.filter(id=pk)
    # print subid
      
    # print carresult

    # for carresults in carresult:
  
    # if adinfo.subcategory_id == 2:

    #     motoresult=Motorcycle.objects.get(id=adinfo.motorcycle_id)
    #     print "result",motoresult.motorcyclebrand_id

    # carbrandname = Carbrand.objects.get(id=carresult.brand_id)
    # print "result1",carbrandname.carbrand

    # carmodelname = Carmodel.objects.get(id=carresult.model_id)
    # print "result2",carmodelname.carmodel

    # print carbrandresult.brand_id
    # carmodelresult = Cars.objects.get(id=adinfo.cars_id)


    # subid=adinfo.subcategory_id
    # print subid

    
    
    return render_to_response('advertisement/adinfo.html', ctx1,context_instance=RequestContext(request))

def post_ad(request, name=None, subname=None):

    print request.path 
    userid=request.user.id

    print "userid", userid
    # print subid
    category=Category.objects.get(name=name)
    subcategory=SubCategory.objects.get(name=subname)
    print subcategory.id

    # subcategory = SubCategory.objects.get(id=subid)
    # print subcategory.name
    # subcategoryname = subcategory.name
    # categoryid=subcategory.category_id
    # category=Category.objects.get(id=categoryid)
    # print category.name
    # categoryname=category.name
    # categoryicon=category.icon
    
    # categorynew=Category.objects.get(pk=categoryid)
    # subcategorynew=SubCategory.objects.get(pk=subid)
    
#     dropdown=Dropdown.objects.all()
    subid=subcategory.id
    sub=Product.get_subcategory(subid)
    
    dropdown=Dropdown.objects.all()

    dropdown_group=Dropdown.objects.filter(subcat_refid=subcategory.id)

    for dropdown_groups in dropdown_group:
        print dropdown_groups.model_name

    for dropdown_groups in dropdown_group:
        
        new_dict = {'cars': dropdown_groups["brand_name"], 'model': dropdown_groups["model_name"]

        }

    
        


    

    # for dropdown_groups in dropdown_group:
    #     if dropdown_groups.sim == '':
    #         nullvalue = 0
    #     else:
    #         print dropdown_groups.carbrand
    # carbrand=dropdown_group.carbrand
    
    
    
    city=City.objects.all()
    locality=Locality.objects.all()
    
    # print "categoryid:", categoryid
    # print "subid:", subid
    ctx = {'userid':userid,'subcategory':subcategory,'category':category,'city':city,
           'locality':locality,'dropdown':dropdown,'dropdown_group':dropdown_group}
    return render_to_response('advertisement/ad.html', ctx , context_instance=RequestContext(request))


def add_product(request):
    success=False
    product=Product()
    
    print request.POST.get('user')
    
    product.user_id=request.POST.get('user')
    print "user id", product.user_id

    
    product.category=Category.objects.get(id=request.POST['category'])
    print product.category.id

    product.subcategory=SubCategory.objects.get(id=request.POST['subcategory'])
    print product.subcategory.id
    print "add_product"
    
    
    if product.subcategory.id == 1:
        print "cars"
        cars=Cars()
        cars.carbrand=Dropdown.objects.get(id=request.POST['brand'])
        
        cars.carmodel=Dropdown.objects.get(id=request.POST['model'])
        cars.caryear=Dropdown.objects.get(id=request.POST['year'])
        cars.kmsdriven=request.POST.get('kmsdriven')
        cars.carcolor=Dropdown.objects.get(id=request.POST['color'])
        cars.carfueltype=Dropdown.objects.get(id=request.POST['fueltype'])
        cars.save()
        product.cars=cars
        
    if product.subcategory.id == 2:
        print "Motorcycle"
        motorcycle=Motorcycle()
        motorcycle.motorcyclebrand=Dropdown.objects.get(id=request.POST['motorcyclebrand'])
        motorcycle.motorcyclemodel=Dropdown.objects.get(id=request.POST['motorcyclemodel'])
        motorcycle.motoryear=Dropdown.objects.get(id=request.POST['year'])
        motorcycle.motorkmsdriven=request.POST.get('kmsdriven')
        motorcycle.save()
        product.motorcycle=motorcycle
        
    if product.subcategory.id == 3:
        print "Scooter"
        scooter=Scooter()
        scooter.scooterbrand=Dropdown.objects.get(id=request.POST['scooterbrand'])
        scooter.scootermodel=Dropdown.objects.get(id=request.POST['scootermodel'])
        scooter.scooteryear=Dropdown.objects.get(id=request.POST['year'])
        scooter.save()
        product.scooter=scooter
        
    if product.subcategory.id == 4:
        print "Bicycle"
        bicycle=Bicycle()
        bicycle.bicycletype=Dropdown.objects.get(id=request.POST['bicycletype'])
        
        bicycle.save()
        product.bicycle=bicycle
    
    if product.subcategory.id == 5:
        print "Sparepart"
        sparepart=Sparepart()
        sparepart.spareproducttype=Dropdown.objects.get(id=request.POST['spareproducttype'])
        
        sparepart.save()
        product.sparepart=sparepart
        
    if product.subcategory.id == 6:
        print "Buses"
        busespart=Busespart()
        busespart.busesvehicletype=Dropdown.objects.get(id=request.POST['busesvehicletype'])
        
        busespart.save()
        product.busespart=busespart
    
    if product.subcategory.id == 7:
        print "Construction"
        construction=Construction()
        construction.constructionvehicletype=Dropdown.objects.get(id=request.POST['constructionvehicletype'])
        
        construction.save()
        product.construction=construction
    
    # if product.subcategory.id == 8:
    #     print "mobiles"
    #     mobiles=Mobiles()
    #     mobiles.mobilebrandname = Mobilebrand.objects.get(id=request.POST['mobilebrandname'])
    #     mobiles.mobilemodelname = Mobilemodel.objects.get(id=request.POST['mobilemodelname'])
    #     mobiles.save()
    #     product.mobile=mobiles

    # mobile phones    
    if product.subcategory.id == 8:
        print "mobile"
        mobiles1=Mobiles()
        mobiles1.mobilebrandname = Dropdown.objects.get(id=request.POST['mobilebrandname'])
        mobiles1.mobilemodelname = Dropdown.objects.get(id=request.POST['mobilemodelname']) 
        mobiles1.mobile_os = Dropdown.objects.get(id=request.POST['mobile_os']) 
        mobiles1.mobile_sim = Dropdown.objects.get(id=request.POST['mobile_sim']) 
        mobiles1.mobile_include = Dropdown.objects.get(id=request.POST['mobile_include']) 
        mobiles1.save()
        product.mobile=mobiles1

# Tablets

    if product.subcategory.id == 9:
        
        tablets1 = Tablets()
        tablets1.tabletbrandname = Dropdown.objects.get(id=request.POST['tabletbrandname'])
        tablets1.save()
        product.tablets=tablets1
        
# Accessoties

    if product.subcategory.id == 10:
        
        access1 = Access()
        access1.accesstypename = Dropdown.objects.get(id=request.POST['accesstypename'])
        access1.accessbrandname = Dropdown.objects.get(id=request.POST['accessbrandname'])
        access1.save()
        product.access=access1
    
    
    product.adtype=request.POST.get('adtype')
    product.title=request.POST.get('title')
    product.photos=request.FILES['photos']
    

    if product.photos:
       from PIL import Image as ImageObj
       from cStringIO import StringIO
       from django.core.files.uploadedfile import SimpleUploadedFile
       import os

       try:
           # thumbnail
           THUMBNAIL_SIZE = (100, 100)  # dimensions

           image = ImageObj.open(product.photos)

           # Convert to RGB if necessary
           if image.mode not in ('L', 'RGB'): image = image.convert('RGB')

           # create a thumbnail + use antialiasing for a smoother thumbnail
           image.thumbnail(THUMBNAIL_SIZE, ImageObj.ANTIALIAS)

           # fetch image into memory
           temp_handle = StringIO()
           image.save(temp_handle, 'png')
           temp_handle.seek(0)

           # save it
           file_name, file_ext = os.path.splitext(product.photos.name.rpartition('/')[-1])
           suf = SimpleUploadedFile(file_name + file_ext, temp_handle.read(), content_type='image/png')

           product.thumbnail.save(file_name + '_thumbnail' +'.png', suf, save=False)
       except ImportError:
           pass



    

    product.condition=request.POST.get('condition')
    product.price=request.POST.get('price')
    
    
    product.city=City.objects.get(id=request.POST['city'])
    product.locality=Locality.objects.get(id=request.POST['locality'])
    product.description=request.POST.get('description','')
    product.you_are = request.POST.get('you_are', '')
    product.you_name = request.POST.get('you_name', '')

    product.you_email   = request.POST.get('you_email', '')
    print product.you_email
    productresult=Product.objects.all()
    count=0
    for productresults in productresult:
        if productresults.you_email == product.you_email:
            count=count+1
    print count
    if count >3:
        emailerror="You exceed the limit"
        print emailerror

    product.you_phone   = request.POST.get('mobile_number', '')

    product.created_date   = datetime.datetime.now()

    print product.created_date

    product.modified_date   = datetime.datetime.now()
    product.save()



    # productsearch=Productsearch()
    # productsearch.title=product.title
    # productsearch.price=product.price
    # productsearch.save()
    
    success=True
    
    ctx = {'success':success}
    return render_to_response('advertisement/ad.html',{ } , context_instance=RequestContext(request))




def category_page(request):
    entries = Category.objects.all()[:10]
    path=request.path
    print path
    return render_to_response('advertisement/category.html', {'category' : entries, 'path':path}, context_instance=RequestContext(request)) 

def post_page(request):
    
    return render_to_response('advertisement/ad.html', { }, context_instance=RequestContext(request)) 







    
def notes(request):
    form = ProductSearchForm(request.GET)
    products = form.search()
    results = [ r.pk for r in products ]
    docs = Product.objects.filter(pk__in=results)
    for doc in docs:
        print doc

    # results = SearchQuerySet().models(Product).autocomplete(title_auto=q)
    return render_to_response('advertisement/notes.html', {'products': products,'docs':docs})


def autocomplete(request):
    sqs = SearchQuerySet().autocomplete(content_auto=request.GET.get('q', ''))[:5]
    suggestions = [result.title for result in sqs]
    # Make sure you return a JSON object, not a bare list.
    # Otherwise, you could be vulnerable to an XSS attack.
    the_data = json.dumps({
        'results': suggestions
    })
    return HttpResponse(the_data, content_type='application/json')

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

def recent_ads(request):
    
    return render_to_response('mainlogin/userpage.html', { 'recentad': recentad ,'path': path }, context_instance=RequestContext(request)) 

# def ad_info(request, pk):
#     adinfo = Product.objects.get(pk=int(pk))
#     print "adinfo"
#     print adinfo
    
#     return render_to_response('advertisement/ad_detail.html', { 'adinfo': adinfo}, context_instance=RequestContext(request)) 