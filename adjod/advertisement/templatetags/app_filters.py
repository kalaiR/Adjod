from django import template

register = template.Library()

@register.filter
def get_photos(photo):
    print "get_photos"
    photo=str(photo).split(',')
    return photo[0]



