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
        
    g = GeoIP()
        
    current_city=g.city(user_ip)['city']
        
    print g.city(user_ip)
        
    code=g.country_code(user_ip)
        
    print "code1", code
        
    country_id=Country.objects.filter(code=g.country_code(user_ip))[0].id
        
    print "country_id1", country_id
    
    # current_city = "Pondicherry"       
    # current_country_cities=City.objects.filter(country_id=Country.objects.filter(code=g.country_code(user_ip))[0].id).exclude(city=current_city)
        
    current_country_cities=City.objects.filter(country_id=1).exclude(city=current_city)
        
    print "current_country_cities1 before", current_country_cities
        
    # current_country_cities = [str(obj.city) for obj in current_country_cities]
        
    print "current_country_cities1 after", current_country_cities
        
    return current_country_cities
    

@register.filter    

def get_current_city_from_cookie(request):
    
    print "get_current_city_from_cookie"
        
    result = get_global_city(request)
        
    return result


