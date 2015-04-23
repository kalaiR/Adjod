from rest_framework import serializers
from services.models import Message

class MessageSerializer(serializers.HyperlinkedModelSerializer):
  class Meta:
       model = Message
       fields = ('author','text','timestamp',)
