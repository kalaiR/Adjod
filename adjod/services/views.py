# Create your views here.
# Create your views here.

from services.models import Message
from rest_framework import viewsets
from services.serializer import MessageSerializer

class MessageViewSet(viewsets.ReadOnlyModelViewSet):
  queryset = Message.objects.all()
  serializer_class = MessageSerializer