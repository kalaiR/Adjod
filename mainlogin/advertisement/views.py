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
# from easy_thumbnails.files import get_thumbnailer
from django.core.files import File
import os
from urllib import unquote, urlencode, unquote_plus
from haystack.inputs import AutoQuery, Exact, Clean
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
import datetime

from django.utils.encoding import smart_unicode, force_unicode
from django.utils import simplejson

import simplejson as json
from haystack.query import SearchQuerySet
from django.db.models import Q
import simplejson as json
from haystack.query import SearchQuerySet
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger



class JSONResponse(HttpResponse):
    def __init__(self, data):
        super(JSONResponse, self).__init__(
                simplejson.dumps(data), mimetype='application/json')

def localities_for_city(request):
    if request.is_ajax() and request.GET and 'city_id' in request.GET:
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

    paginator = Paginator(searchresults, 1) # Show 25 contacts per page

    
    try:
        page = int(request.GET.get('page', '1'))
    except:
        page=1

    try:
        searchresults = paginator.page(page)
        
    except(EmptyPage, InvalidPage):
        # If page is out of range (e.g. 9999), deliver last page of results.
        searchresults = paginator.page(paginator.num_pages)
    
    ctx = {'searchresults':searchresults, 'recentad':recentad, 'path':path,'page':page}
    return render_to_response('advertisement/search.html', ctx , context_instance=RequestContext(request))

def ad_info(request, pk):
    
    
    adinfo=Product.objects.get(pk=int(pk))
    print adinfo
    print "adbrand", adinfo.ad_brand
    print "adtype", adinfo.ad_type_id

    if adinfo.subcategory_id==1:
        ad_type=Dropdown.objects.get(id=adinfo.ad_type_id)

        ad_model=Dropdown.objects.get(id=adinfo.ad_model_id)
        ctx={'adinfo':adinfo,'ad_type':ad_type,'ad_model':ad_model}
    if adinfo.subcategory_id==2 or adinfo.subcategory_id==3:
        ad_model=Dropdown.objects.get(id=adinfo.ad_model_id)
        ctx={'adinfo':adinfo,'ad_model':ad_model}
    
    if adinfo.subcategory_id==4:
        ad_type=Dropdown.objects.get(id=adinfo.ad_type_id)
        ctx={'adinfo':adinfo,'ad_type':ad_type}
    if adinfo.subcategory_id==5:
        ad_type=Dropdown.objects.get(id=adinfo.ad_type_id)
        ctx={'adinfo':adinfo,'ad_type':ad_type}
    if adinfo.subcategory_id==6:
        ad_type=Dropdown.objects.get(id=adinfo.ad_type_id)
        ctx={'adinfo':adinfo,'ad_type':ad_type}
    if adinfo.subcategory_id==7:
        ad_type=Dropdown.objects.get(id=adinfo.ad_type_id)
        ctx={'adinfo':adinfo,'ad_type':ad_type}
    if adinfo.subcategory_id==8:
        ad_model=Dropdown.objects.get(id=adinfo.ad_model_id)
        ad_os=Dropdown.objects.get(id=adinfo.ad_os_id)
        ad_sim=Dropdown.objects.get(id=adinfo.ad_sim_id)
        ad_alsoinclude=Dropdown.objects.get(id=adinfo.ad_alsoinclude_id)
        ctx={'adinfo':adinfo,'ad_model':ad_model,'ad_os':ad_os,'ad_sim':ad_sim,'ad_alsoinclude':ad_alsoinclude}
    if adinfo.subcategory_id==9:
        ctx={'adinfo':adinfo}
    if adinfo.subcategory_id==10:
        ad_type=Dropdown.objects.get(id=adinfo.ad_type_id)
        print ad_type.type_name
        ctx={'adinfo':adinfo,'ad_type':ad_type}
 
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

    # ctx={'adinfo':adinfo}
    # ctx={'adinfo':adinfo,'ad_type':ad_type,'ad_model':ad_model,'ad_os':ad_os,'ad_sim':ad_sim,'ad_alsoinclude':ad_alsoinclude}
    return render_to_response('advertisement/adinfo.html',ctx,context_instance=RequestContext(request))

def post_ad(request, name=None, subname=None):

    print request.path 
    userid=request.user.id

    print "userid", userid
    # print subid
    category=Category.objects.get(name=name)
    subcategory=SubCategory.objects.get(name=subname)
    print subcategory.id

    subid=subcategory.id
    sub=Product.get_subcategory(subid)
    
    dropdown=Dropdown.objects.all().exclude(year='', color='')

    # dropdown_group=Dropdown.objects.filter(subcat_refid=subcategory.id).exclude(Q(brand_name='') | Q(type_name=''))
    dropdown_group_brand=Dropdown.objects.filter(subcat_refid=subcategory.id).exclude(brand_name='')
    dropdown_group_type=Dropdown.objects.filter(subcat_refid=subcategory.id).exclude(type_name='')
    dropdown_group_os=Dropdown.objects.filter(subcat_refid=subcategory.id).exclude(os='')
    dropdown_group_sim=Dropdown.objects.filter(subcat_refid=subcategory.id).exclude(sim='')
    dropdown_group_alsoinclude=Dropdown.objects.filter(subcat_refid=subcategory.id).exclude(alsoinclude='')
    
    
    
    city=City.objects.all()
    locality=Locality.objects.all()
    
    # print "categoryid:", categoryid
    # print "subid:", subid
    ctx = {'userid':userid,'subcategory':subcategory,'category':category,'city':city,
           'locality':locality,'dropdown':dropdown,'dropdown_group_os':dropdown_group_os,'dropdown_group_sim':dropdown_group_sim,
           'dropdown_group_alsoinclude':dropdown_group_alsoinclude,'dropdown_group_brand':dropdown_group_brand,'dropdown_group_type':dropdown_group_type}
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
        
        product.ad_brand=Dropdown.objects.get(id=request.POST['brand'])
        
        product.ad_model=Dropdown.objects.get(id=request.POST['model'])
        product.ad_year=Dropdown.objects.get(id=request.POST['year'])
        product.ad_kmsdriven=request.POST.get('kmsdriven')
        product.ad_color=Dropdown.objects.get(id=request.POST['color'])
        product.ad_type=Dropdown.objects.get(id=request.POST['fueltype'])
        
        
    if product.subcategory.id == 2:
        print "Motorcycle"
        
        product.ad_brand=Dropdown.objects.get(id=request.POST['brand'])
        product.ad_model=Dropdown.objects.get(id=request.POST['model'])
        product.ad_year=Dropdown.objects.get(id=request.POST['year'])
        product.ad_kmsdriven=request.POST.get('kmsdriven')
        
         
    if product.subcategory.id == 3:
        print "Scooter"
        
        product.ad_brand=Dropdown.objects.get(id=request.POST['brand'])
        product.ad_model=Dropdown.objects.get(id=request.POST['model'])
        product.ad_year=Dropdown.objects.get(id=request.POST['year'])
        
        
    if product.subcategory.id == 4:
        
        product.ad_type=Dropdown.objects.get(id=request.POST['spareproducttype'])
     
    if product.subcategory.id == 5:
       
        product.ad_type=Dropdown.objects.get(id=request.POST['bicycletype'])
        
       
    if product.subcategory.id == 6:
        
        product.ad_type=Dropdown.objects.get(id=request.POST['busesvehicletype'])
        
        
    
    if product.subcategory.id == 7:
        
        product.ad_type=Dropdown.objects.get(id=request.POST['constructionvehicletype'])


    if product.subcategory.id == 8:
        
        product.ad_brand = Dropdown.objects.get(id=request.POST['brand'])
        product.ad_model = Dropdown.objects.get(id=request.POST['model'])
        
        product.ad_os = Dropdown.objects.get(id=request.POST['mobile_os']) 
        product.ad_sim = Dropdown.objects.get(id=request.POST['mobile_sim']) 
        product.ad_alsoinclude = Dropdown.objects.get(id=request.POST['mobile_include']) 
        
    
    if product.subcategory.id == 9:
        product.ad_brand = Dropdown.objects.get(id=request.POST['brand'])
        
    
    if product.subcategory.id == 10:
        
        product.ad_type = Dropdown.objects.get(id=request.POST['accesstypename'])
        product.ad_brand = Dropdown.objects.get(id=request.POST['brand'])
        
    
    
    product.adtype=request.POST.get('adtype')
    product.title=request.POST.get('title')
    # product.photos=request.FILES['photos']

    product.photos=request.FILES.getlist('photos[]')
    print product.photos
    photosgroup=''
    
    # last_index = len(product.photos)
    for index in range(len(product.photos)): 
        print index      
        # last_index =last_index+1
        # print last_index
        if index==len(product.photos) -1 :
            photosgroup=photosgroup + settings.STATIC_ROOT + str(product.photos[index])
        else:
            photosgroup=photosgroup + settings.STATIC_ROOT + str(product.photos[index]) + ','
        # photosgroup = photosgroup + ',' + str(photos)
    print photosgroup
    
    product.photos =photosgroup
    print product.photos
    

    # if product.photos:
    #    from PIL import Image as ImageObj
    #    from cStringIO import StringIO
    #    from django.core.files.uploadedfile import SimpleUploadedFile
    #    import os

    #    try:
    #        # thumbnail
    #        THUMBNAIL_SIZE = (100, 100)  # dimensions

    #        image = ImageObj.open(product.photos)

    #        # Convert to RGB if necessary
    #        if image.mode not in ('L', 'RGB'): image = image.convert('RGB')

    #        # create a thumbnail + use antialiasing for a smoother thumbnail
    #        image.thumbnail(THUMBNAIL_SIZE, ImageObj.ANTIALIAS)

    #        # fetch image into memory
    #        temp_handle = StringIO()
    #        image.save(temp_handle, 'png')
    #        temp_handle.seek(0)

    #        # save it
    #        file_name, file_ext = os.path.splitext(product.photos.name.rpartition('/')[-1])
    #        suf = SimpleUploadedFile(file_name + file_ext, temp_handle.read(), content_type='image/png')

    #        product.thumbnail.save(file_name + '_thumbnail' +'.png', suf, save=False)
    #    except ImportError:
    #        pass



    

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

