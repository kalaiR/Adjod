from django import template
from django.db.models import *
from advertisement.models import *

register = template.Library()

@register.filter
def get_photos(photo): 
    photo=str(photo).split(',')
    print "get_photos"
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
	subcategoriescounts = Product.objects.filter(subcategory_id=subCategoryId).count()          		
	# subcategoriescounts = Product.objects.filter(subcategory_id=subCategoryId).annotate(Count('subcategory'))			
	return subcategoriescounts

@register.filter
def get_brandforsubcategory(subCategoryId):  	
	# brandforsubcategory = Dropdown.objects.filter(subcat_refid=subCategoryId).exclude(brand_name='')
	brandforsubcategory = Dropdown.objects.filter(subcat__id=subCategoryId).exclude(brand_name='')
	return brandforsubcategory		

@register.filter
def get_banner(banner):	
	banner=SiteBanner.objects.all().order_by('?')
	print "get_banner"
	print banner.link
	return banner




