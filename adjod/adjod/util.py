import os
import random
import string
import uuid
import urllib2
from django.conf import settings
from django.contrib.gis.geoip import GeoIP
from adjod import globals
# from ipware.ip import get_ip
from advertisement.models import *

def get_client_ip(request):
    # x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    # print "x_forwarded_for", x_forwarded_for
    # if x_forwarded_for:
    #     ip = x_forwarded_for.split(',')[0]
    #     print "x_forwarded_for ip", ip
    # else:
    #     ip = request.META.get('REMOTE_ADDR')
    #     print "remote ip", ip
    # return ip
    
    # x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    # print "x_forwarded_for", x_forwarded_for
    # if x_forwarded_for:
    #     ip = x_forwarded_for.split(',')[-1].strip()
    # else:
    #     ip = request.META.get('REMOTE_ADDR')
    # return ip

    # import ipgetter
    # IP = ipgetter.myip()
    # return IP 

    ''' This utility gets client's IP address from the request
    '''
    print 'value==', request.META.get('HTTP_X_FORWARDED_FOR', request.META.get('REMOTE_ADDR', '127.0.0.1'))
    return request.META.get('HTTP_X_FORWARDED_FOR', request.META.get('REMOTE_ADDR', '127.0.0.1'))

def get_global_language(request):
    """ This function get global language based on following assets
        
        1. authenticated user's language
        2. cookie
        2. fixido select language
        3. query string
        4. brower setting
        5. default sweden
    """
    cookies_language = request.COOKIES.get(settings.LANGUAGE_COOKIE_NAME)
    if cookies_language:
        select_language = request.POST.get('language', None)
        
        if select_language and select_language != cookies_language:
            cookies_language = select_language
    else:
       url_language = request.GET.get('la', request.POST.get('language', '')).strip()
       if url_language and url_language.lower() != 'none':
            cookies_language = url_language
       else:
            try:
                user_ip = globals.ip
                if user_ip.startswith('127.0.0') or user_ip.startswith('192.168.1'):
                    user_ip = '114.69.235.2'
                g = GeoIP()
                country = g.country_code(user_ip)
                # print "country", country
                language_list = ['en','sv','de']
                country_language_dict = {
                    'AU':'en','IN':'en','SE':'sv','DE':'de',
                    'US':'en','GB':'en','CA':'en','AF':'aa','AX':'en',
                    'AL':'sq','DZ':'ar','AS':'en','AD':'ca','AO':'pt',
                    'AI':'en','AQ':'en','AG':'en','AR':'es','AM':'en',
                    'AW':'nl','AT':'de','AZ':'az','BS':'en','BH':'en',
                    'BD':'en','BB':'en','BY':'en','BE':'fr','BZ':'en',
                    'BM':'en','BT':'en','BO':'es','BQ':'es','BA':'bs',
                    'BW':'en','BV':'en','BR':'pt','IO':'en','BN':'en',
                    'BG':'en','BF':'en','BI':'en','KH':'km','CM':'fr',
                    'CA':'en','CV':'pt','KY':'en','CF':'fr','TD':'fr',
                    'CL':'es','CN':'zh','CX':'en','CC':'en','CO':'es',
                    'KM':'es','CG':'fr','CD':'fr','CK':'en','CR':'es',
                    'CI':'en','HR':'hr','CU':'es','CW':'fr','CY':'el',
                    'CZ':'cs','DK':'da','DJ':'en','DM':'en','DO':'es',
                    'EC':'es','EG':'ar','SV':'es','GQ':'fr','ER':'en',
                    'EE':'et','ET':'am','FK':'en','FO':'da','FJ':'en',
                    'FI':'sv','FR':'fr','GF':'fr','PF':'fr','TF':'fr',
                    'GA':'fr','GM':'en','GE':'en','DE':'de','GH':'en',
                    'GI':'en','GR':'el','GL':'kl','GD':'en','GP':'fr',
                    'GU':'en','GT':'es','GG':'fr','GN':'fr','GW':'fr',
                    'GY':'en','HT':'fr','HM':'en','VA':'en','HN':'es',
                    'HK':'en','HU':'hu','IS':'en','ID':'id','IR':'fa',
                    'IQ':'ar','IE':'en','IM':'en','IL':'ar','IT':'it',
                    'JM':'en','JP':'ja','JE':'en','JO':'ar','KZ':'ru',
                    'KE':'sw','KI':'en','KP':'ko','KR':'ko','KW':'ar',
                    'KG':'ru','LA':'lo','LV':'lv','LB':'ar','LS':'en',
                    'LR':'li','LY':'ar','LI':'de','LT':'lt','LU':'de',
                    'MO':'pt','MK':'mk','MG':'fr','MW':'en','MY':'ms',
                    'MV':'en','ML':'fr','MT':'fr','MH':'en','MQ':'fr',
                    'MR':'ar','MU':'en','YT':'fr','MX':'es','FM':'en',
                    'MD':'en','MC':'fr','MN':'mn','ME':'en','MS':'en',
                    'MA':'fr','MZ':'pt','MM':'my','NA':'en','NR':'en',
                    'NP':'ne','NL':'nl','NC':'en','NZ':'en','NI':'es',
                    'NE':'fr','NG':'en','NU':'en','NF':'en','MP':'en',
                    'NO':'no','OM':'ar','PK':'ur','PW':'en','PS':'ar',
                    'PA':'es','PG':'en','PY':'es','PE':'es','PH':'en',
                    'PN':'en','PL':'pl','PT':'pt','PR':'es','QA':'ar',
                    'RE':'ro','RO':'ro','RU':'ru','RW':'fr','BL':'en',
                    'SK':'en','KN':'en','LC':'en','MF':'en','PM':'en',
                    'WS':'en','SM':'it','ST':'pt','SA':'ar','SN':'fr',
                    'RS':'sr','SC':'fr','SL':'en','SG':'en','SX':'en',
                    'SK':'sk','SI':'sl','SB':'en','SO':'ar','ZA':'en',
                    'GS':'en','SS':'su','ES':'es','LK':'en','SD':'su',
                    'SR':'nl','SJ':'en','SZ':'en','SE':'sv','CH':'de',
                    'SY':'ar','TW':'en','TJ':'fa','TZ':'en','TH':'th',
                    'TL':'pt','TG':'fr','TK':'en','TO':'en','TT':'en',
                    'TN':'ar','TR':'tr','TM':'tk','TC':'en','TV':'en',
                    'UG':'en','UA':'uk','AE':'ar','GB':'en','US':'en',
                    'UM':'en','UY':'es','UZ':'uz','VU':'fr','VE':'ve',
                    'VN':'vi','VG':'en','VI':'en','WF':'fr','EH':'ar',
                    'YE':'ar','ZM':'en','ZW':'en',}
                if country_language_dict[country] in language_list:
                    return country_language_dict[country]
                else:
                    selected_language = 'en'
                    return selected_language

            except Exception as e:
                cookies_language = request.META.get('HTTP_ACCEPT_LANGUAGE', 'en').split(',')[0]
    return cookies_language[:2]

def get_global_country(request):
    """ This function get global language based on following assets
        
        1. authenticated user's language
        2. cookie
        2. fixido select language
        3. query string
        4. brower setting
        5. default sweden
    """ 
    user_ip = globals.ip
    # local
    if user_ip.startswith('127.0.0') or user_ip.startswith('192.168.1'):
        user_ip = '114.69.235.2'
    g = GeoIP()
    country = g.country_code(user_ip)
    # print "country", country
    return country

def get_current_country_cities(request):
    user_ip = globals.ip
    # local
    if user_ip.startswith('127.0.0') or user_ip.startswith('192.168.1'):
        user_ip = '114.69.235.2'
    g = GeoIP()
    country = g.country_code(user_ip)
    print "country", country   
    current_country_cities = City.objects.filter(country_code=country)
    return current_country_cities

def get_global_city(request):
    """ This function get global language based on following assets
        
        1. authenticated user's language
        2. cookie
        2. fixido select language
        3. query string
        4. brower setting
        5. default sweden
    """ 
    user_ip = globals.ip
    print "user_ip from get_global_city in util", user_ip
    # local
    if user_ip.startswith('127.0.0') or user_ip.startswith('192.168.1'):
        user_ip = '114.69.235.2'
    g = GeoIP()
    print '123456789', g.city(user_ip)
    city=g.city(user_ip)['city']    
    print "city in util.py", city
    return city

def get_global_city_id(request):
    user_ip = globals.ip
    # local
    if user_ip.startswith('127.0.0') or user_ip.startswith('192.168.1'):
        user_ip = '114.69.235.2'
    g = GeoIP()
    city=g.city(user_ip)['city']
    print "city", city
    if not city:
        city = "Pondicherry" 
    if City.objects.filter(city=city).exists():
        city = City.objects.get(city=city)
        city_id=city.id
    else:
        country = get_global_country(request)
        city_model = City()
        city_model.city = city
        city_model.country_code = country
        city_model.country_name = g.country_name(user_ip)
        city_model.save()
        city_id = city_model.id
    print "city_id", city_id
    return city_id    

        
def format_redirect_url(redirect_path, query_string):
    ''' utility to format redirect url with fixido query string
    '''
    stop_popup = True if 'st=' in query_string else False
    
    url_join_str = '?'
    if url_join_str in redirect_path:
        redirect_path, qs = redirect_path.split(url_join_str, 1)
        query_string = qs + '&' + query_string
    
    qs = {}
    for q in query_string.split('&'):
        if '=' in q:
            k, v = q.split('=', 1)
            qs[k] = v
    
    if stop_popup:
        if qs.has_key('zr'): del qs['zr']
        if qs.has_key('lr'): del qs['lr']
        if qs.has_key('ler'): del qs['ler']
        if qs.has_key('thanks'): del qs['thanks']
    
    query_string = ''
    for k in qs:
        query_string += k + '=' + qs[k] + '&'
        
    return redirect_path + url_join_str + query_string[:-1]
