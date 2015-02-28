from django import forms

from advertisement.models import *
import pprint


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

class ProductSearchForm(SearchForm):

    def no_query_found(self):
        return self.searchqueryset.all()
    
class UploadFileForm(forms.Form):
    
    photos  = forms.FileField()
    
    


    