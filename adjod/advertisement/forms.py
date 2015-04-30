from django import forms

from advertisement.models import *
import pprint
from advertisement.admin import *
from advertisement.forms import *
# from advertisement.admin import DropdownAdmin


# 
# class CarmodelForm(forms.Form):
# #     class Meta:
# #         model = Carmodel
#     def __init__(self, *args, **kwargs):
#         super(CarmodelForm, self).__init__(*args, **kwargs)
#         self.fields['foo'].queryset = Dropdown.objects.filter(car_brand)# or something else

from haystack.forms import SearchForm


# class NotesSearchForm(SearchForm):

#     def no_query_found(self):
#         return self.searchqueryset.all()


# class ProductForm(forms.ModelForm):
#   """
#   Form for NeedHelp model
#   """
#   def __init__(self, *args, **kwargs):
#     super(Product, self).__init__(*args, **kwargs)
#     self.fields['you_email'].widget.attrs['class'] = 'required'

#   class Meta:
#     model = Product
#     fields = ['category', 'adtype', 'title', 'price', 'description', 'you_email',]
#     error_messages = {
#       'category': {
#         'required': "Please choose category"
#       },
#       'adtype': {
#         'required': "Please choose adtype"
#       },
#       'title': {
#         'required': "Please enter title."
#       },
#       'price': {
#         'required': "Please enter price."
#       },
#       'description': {
#         'required': "Please enter description."
#       },
#       'you_email': {
#         'required': "Please enter valid email address"
#       }
#     }


class ProductSearchForm(SearchForm):

    def no_query_found(self):
        return self.searchqueryset.all()
    
class UploadFileForm(forms.Form):
    
    photos  = forms.FileField()


# class ProductForm(forms.ModelForm):
#     locality = forms.ModelChoiceField(Locality.objects, widget=LocalityChoiceWidget(),label=ugettext_lazy("Locality"), required=False)
#     ad_model = forms.ModelChoiceField(Dropdown.objects, widget=ModelChoiceWidget(),label=ugettext_lazy("Model"), required=False)

    

#     class Meta:
#         model = Product

#     def __init__(self, *args, **kwargs):
#         """
#         We need access to the county field in the municipality widget, so we
#         have to associate the form instance with the widget.
#         """
#         super(ProductForm, self).__init__(*args, **kwargs)
#         self.fields['locality'].widget.form_instance = self
#         self.fields['ad_model'].widget.form_instance = self
    
# class AdminDropdownForm(forms.ModelForm):
#     brand_refid = forms.ModelChoiceField(queryset=Dropdown.objects, empty_label=None)

#     class Meta:
#         model = Dropdown    
    
    


    