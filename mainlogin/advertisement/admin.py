from advertisement.models import *
from django.contrib import admin
from advertisement.forms import * 



admin.site.register(Product)
admin.site.register(Category)
admin.site.register(SubCategory)

admin.site.register(Cars)
admin.site.register(Motorcycle)
admin.site.register(Scooter)
admin.site.register(Bicycle)
admin.site.register(Sparepart)
admin.site.register(Busespart)
admin.site.register(Construction)

admin.site.register(Carbrand)
admin.site.register(Carmodel)
admin.site.register(Motorbrand)
admin.site.register(Motormodel)
admin.site.register(Scooterbrand)
admin.site.register(Scootermodel)
admin.site.register(Bicycletype)

admin.site.register(Spare_Producttype)
admin.site.register(Buses_Vehicletype)
admin.site.register(Construction_Vehicletype)
admin.site.register(Year)
admin.site.register(Color)
admin.site.register(Fueltype)

admin.site.register(City)
admin.site.register(Locality)

admin.site.register(Mobilebrand)
admin.site.register(Mobilemodel)
admin.site.register(Os)
admin.site.register(Sim)
admin.site.register(Mobileinclude)
admin.site.register(Tabletbrand)
admin.site.register(Accesstype)
admin.site.register(Accessbrand)
admin.site.register(Mobiles)




# admin.site.register(Note)
# admin.site.register(Productsearch)

# 
# class CarmodelAdmin(admin.ModelAdmin):
#     form = CarmodelForm