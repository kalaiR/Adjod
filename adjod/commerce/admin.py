from django.contrib import admin
from commerce.models import Order, Transaction


class OrderAdmin(admin.ModelAdmin):
    fields = ['banner', 'banner_plan']
    list_display = ('id', 'banner')
    list_filter = ['banner__admin_status', 'banner_plan__page','banner_plan__position']
    search_fields = ['banner__user']
    list_per_page = 50


class TransactionAdmin(admin.ModelAdmin):
    fields = ['userprofile', 'transaction_mode', 'transaction_type', 'order', 'paypal', 'account_no', 'payment_status']
    list_display = ('id', 'userprofile', 'transaction_mode', 'transaction_type', 'order', 'paypal' , 'payment_status')
    list_filter = ['transaction_mode', 'transaction_type']
    search_fields = ['userprofile__username', 'order', 'paypal']
    list_per_page = 50

admin.site.register(Order, OrderAdmin)
admin.site.register(Transaction, TransactionAdmin)
