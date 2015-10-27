from django import template
from django.db.models import *
from advertisement.models import *
from banner.models import *
from adjod.views import *
# from django.contrib.gis.geoip import GeoIP
register = template.Library()

@register.filter
def get_photos(photo): 
    photo=str(photo).split(',')
    # print "get_photos"
    return photo[0]

@register.filter
def get_videos(video):    
    video=str(video).split(',')
    return video[0]

@register.filter
def get_categories(initial_load):  
	category=Category.objects.all()	
	return category

@register.filter
def get_subcategories(categoryId):  	
	subcategories = SubCategory.objects.filter(category_id=categoryId)		
	return subcategories	

@register.filter
def get_subcategoriesCount(subCategoryId):  
	subcategoriescounts = Product.objects.filter(subcategory_id=subCategoryId, status_isactive=1).count()          		
	# subcategoriescounts = Product.objects.filter(subcategory_id=subCategoryId).annotate(Count('subcategory'))			
	return subcategoriescounts

@register.filter
def get_brandforsubcategory(subCategoryId):  	
	# brandforsubcategory = Dropdown.objects.filter(subcat_refid=subCategoryId).exclude(brand_name='')
	brandforsubcategory = Dropdown.objects.filter(subcat__id=subCategoryId).exclude(brand_name='')
	return brandforsubcategory	

@register.filter
def get_banner(banner):
	banner=SiteBanner.objects.all()
	return banner

@register.filter
def conversion(price):
    # return 1
	return convert(price)

@register.filter
def get_city(request):    
    user_ip = globals.ip
    # local
    if user_ip.startswith('127.0.0'):
        user_ip = '114.69.235.2'
    g = GeoIP()
    country = g.country_code(user_ip)
    print "country", country   
    current_city = get_global_city(request)
    print "current_city", current_city
    current_country_cities = City.objects.filter(country_code=country)
    return current_country_cities
    

@register.filter    
def get_current_city_from_cookie(request):   
    print "get_current_city_from_cookie"
    result = get_global_city(request)        
    return result


