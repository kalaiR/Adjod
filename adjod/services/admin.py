from django.contrib import admin
from services.models import Message

class MessageAdmin(admin.ModelAdmin):
 list_display = ('author','text', 'timestamp')

admin.site.register(Message, MessageAdmin)