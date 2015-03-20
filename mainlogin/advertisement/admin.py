from django import forms
# from advertisement.forms import DropdownForm
from django.forms import widgets
from django.forms.util import flatatt
from django.utils.encoding import smart_unicode
from django.utils.safestring import mark_safe
	
from django.utils.translation import ugettext_lazy
from django.contrib import admin
from advertisement.models import *
from advertisement.forms import *






import pprint
from django.http import HttpResponseRedirect
from django.http import HttpResponse, Http404

class AdminDropdownForm(forms.ModelForm):
    class Meta:
        model = Dropdown   
    brand_refid = forms.ModelChoiceField(queryset=Dropdown.objects.exclude(brand_name=''), required=False)
    # brand_refid = forms.ModelChoiceField(queryset=Dropdown.objects.exclude(brand_name=''), empty_label=None)

    


# class DropdownAdmin(admin.ModelAdmin):
#     list_display = ('carbrand', 'year', 'color')
#     list_filter  = ('carbrand', 'year')
#     search_fields = ('carbrand', 'year')

# class NoteInline(admin.StackedInline):
#     brand_refid = forms.ModelChoiceField(queryset=Dropdown.objects, empty_label=None)
    # #admin_note_user = forms.ModelMultipleChoiceField(queryset=Actor.objects.all(), widget=widgets.SelectMultiple())
    # form = DropdownForm
    # model = Dropdown
    # # extra = 1

class DropdownAdmin(admin.ModelAdmin):

    form = AdminDropdownForm


    
    
    list_display = ('id','subcat_refid', 'brand_name', 'brand_refid', 'model_name','type_name','year','color','os',
        'sim','alsoinclude')
    # list_filter = ['brand_name', 'model_name']
    search_fields = ['id', 'brand_name','model_name']

    # search_fields = ['id', 'brand_name','model_name','subcat__id','subcat__name']
    # actions=[remove_none]
    # inlines = [NoteInline]
  
    fieldsets = [
        ('Basics', {'fields': ['id', 'subcat_refid']}),
        ('Brand', {'fields': ['brand_name']}),
        ('Brand & Model', {'fields': ['brand_refid', 'model_name' ]}),
        
        ('Other Fields', {'fields': ['type_name','os','sim','alsoinclude']}),
        ('Common Fields', {'fields': ['year', 'color']}),
             
    ]
  
    # readonly_fields = ('id', 'dg_brand_refid')
    readonly_fields =['id']
  
    list_per_page = 50

    

    # def dg_brand_refid(self, instance):
    #   pprint.pprint("function called") 
    #   if instance.dg_brand_refid:
    #       return instance.dg_brand_refid.id
    #   else:
    #       return None

    # self.remove_none()

    # def queryset(self, request):
    #     qs = super(DropdownAdmin, self).queryset(request)
    #     brandid = Dropdown.objects.exclude(brand_refid=None)
    #     return qs.exclude(brand_refid=brandid)

    def export_csv(modeladmin, request, queryset):
        import csv
        from django.utils.encoding import smart_str
        response = HttpResponse(mimetype='text/csv')
        response['Content-Disposition'] = 'attachment; filename=dropdown.csv'
        writer = csv.writer(response, csv.excel)
        response.write(u'\ufeff'.encode('utf8'))
        writer.writerow([
            smart_str(u"ID"),
            smart_str(u"subcat_refid"),
            smart_str(u"brand"),
            smart_str(u"brand_refid"),
            smart_str(u"model"),
            smart_str(u"type_name"),
            smart_str(u"year"),
            smart_str(u"color"),
            smart_str(u"os"),
            smart_str(u"sim"),
            smart_str(u"alsoinclude"),
        ])
        for obj in queryset:
            writer.writerow([
                smart_str(obj.pk),
                smart_str(obj.subcat_refid),
                smart_str(obj.brand),
                smart_str(obj.brand_refid),
                smart_str(obj.model),
                smart_str(obj.type_name),
                smart_str(obj.year),
                smart_str(obj.color),
                smart_str(obj.os),
                smart_str(obj.sim),
                smart_str(obj.alsoinclude),
            ])
        return response
    export_csv.short_description = u"Export CSV"
        
    actions = [export_csv]

    


# class LocalityChoiceWidget(widgets.Select):
#     def render(self, name, value, attrs=None, choices=()):
#         self.choices = [(u"", u"---------")]
#         if value is None:
#             # if no municipality has been previously selected,
#             # render either an empty list or, if a county has
#             # been selected, render its municipalities
#             value = ''
#             model_obj = self.form_instance.instance
#             if model_obj and model_obj.city:
#                 for m in model_obj.city.locality_set.all():
#                     self.choices.append((m.id, smart_unicode(m)))
#         else:
#             # if a municipality X has been selected,
#             # render only these municipalities, that belong
#             # to X's county
#             obj = Locality.objects.get(id=value)

#             for m in Locality.objects.filter(city=obj.city):

#                 self.choices.append((m.id, smart_unicode(m)))

#         # copy-paste from widgets.Select.render
#         final_attrs = self.build_attrs(attrs, name=name)
#         output = [u'<select%s>' % flatatt(final_attrs)]
#         options = self.render_options(choices, [value])
#         if options:
#             output.append(options)
#         output.append('</select>')
#         return mark_safe(u'\n'.join(output))



class ModelChoiceWidget(widgets.Select):
    def render(self, name, value, attrs=None, choices=()):
        self.choices = [(u"", u"---------")]
        if value is None:
            # if no municipality has been previously selected,
            # render either an empty list or, if a county has
            # been selected, render its municipalities
            value = ''
            model_obj = self.form_instance.instance
            if model_obj and model_obj.brand_name:
                for m in model_obj.brand_name.model_set.all():
                    self.choices.append((m.id, smart_unicode(m)))
        else:
            # if a municipality X has been selected,
            # render only these municipalities, that belong
            # to X's county
            obj = Dropdown.objects.get(id=value)
            for m in Dropdown.objects.filter(brand_name=obj.brand):
                self.choices.append((m.id, smart_unicode(m)))

        # copy-paste from widgets.Select.render
        final_attrs = self.build_attrs(attrs, name=name)
        output = [u'<select%s>' % flatatt(final_attrs)]
        options = self.render_options(choices, [value])
        if options:
            output.append(options)
        output.append('</select>')
        return mark_safe(u'\n'.join(output))




# class ProductAdmin(admin.ModelAdmin):
#     form = ProductForm
#     class Media:
#         js = ('http://ajax.googleapis.com/ajax/libs/jquery/1.4.0/jquery.min.js',
#                 '/static/js/action.js')

# admin.site.register(Product, ProductAdmin)



# admin.site.register(Product)
# admin.site.register(Category)
# admin.site.register(SubCategory)

admin.site.register(Dropdown, DropdownAdmin)


admin.site.register(City)
admin.site.register(Locality)


# admin.site.register(Note)
# admin.site.register(Productsearch)

# 
# class CarmodelAdmin(admin.ModelAdmin):
#     form = CarmodelForm