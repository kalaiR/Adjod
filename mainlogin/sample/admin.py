from django.contrib import admin
from sample.models import *
import pprint
from django.http import HttpResponseRedirect
from django.http import HttpResponse, Http404

# used for retreiving brand and model
class DropdownAdmin(admin.ModelAdmin):
	print "Hello DropdownAdmin"
  	list_display = ('id','dg_subcat_refid', 'dg_brand', 'dg_brand_refid', 'dg_model','dg_type_name','dg_year','dg_color','dg_os',
  		'dg_sim','dg_alsoinclude')
  	list_filter = ['dg_brand', 'dg_model']
  	search_fields = ['id', 'dg_brand','dg_model','subcat__id','subcat__name']
  
  	fieldsets = [
  		('Basics', {'fields': ['id', 'dg_subcat_refid']}),
      	('Brand', {'fields': ['dg_brand']}),
      	('Brand & Model', {'fields': ['dg_brand_refid', 'dg_model' ]}),
      	
      	('Other Fields', {'fields': ['dg_type_name','dg_os','dg_sim','dg_alsoinclude']}),
      	('Common Fields', {'fields': ['dg_year', 'dg_color']}),
      	     
  	]
  
  	# readonly_fields = ('id', 'dg_brand_refid')
  	readonly_fields =['id']
  
  	list_per_page = 10

  	print "Hello DropdownAdmin1"

  	# def dg_brand_refid(self, instance):
	# 	pprint.pprint("function called") 
	# 	if instance.dg_brand_refid:
	# 		return instance.dg_brand_refid.id
	# 	else:
	# 		return None

  	def export_csv(modeladmin, request, queryset):
	    import csv
	    from django.utils.encoding import smart_str
	    response = HttpResponse(mimetype='text/csv')
	    response['Content-Disposition'] = 'attachment; filename=dropdown.csv'
	    writer = csv.writer(response, csv.excel)
	    response.write(u'\ufeff'.encode('utf8'))
	    writer.writerow([
	        smart_str(u"ID"),
	        smart_str(u"dg_subcat_refid"),
	        smart_str(u"dg_brand"),
	        smart_str(u"dg_brand_refid"),
	        smart_str(u"dg_model"),
	        smart_str(u"dg_type_name"),
	        smart_str(u"dg_year"),
	        smart_str(u"dg_color"),
	        smart_str(u"dg_os"),
	        smart_str(u"dg_sim"),
	        smart_str(u"dg_alsoinclude"),
		])
	    for obj in queryset:
	        writer.writerow([
	            smart_str(obj.pk),
	            smart_str(obj.dg_subcat_refid),
	            smart_str(obj.dg_brand),
	            smart_str(obj.dg_brand_refid),
	            smart_str(obj.dg_model),
	            smart_str(obj.dg_type_name),
	            smart_str(obj.dg_year),
	            smart_str(obj.dg_color),
	            smart_str(obj.dg_os),
	            smart_str(obj.dg_sim),
	            smart_str(obj.dg_alsoinclude),
	        ])
	    return response
	export_csv.short_description = u"Export CSV"
	    
	actions = [export_csv]   

	

#admin registration
admin.site.register(Cat)
admin.site.register(SubCat)
admin.site.register(Dropdown, DropdownAdmin)


