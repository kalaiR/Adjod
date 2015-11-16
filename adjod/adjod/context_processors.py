from django.contrib.gis.geoip import GeoIP
from adjod import globals
from advertisement.models import *

# import threading
# globals = threading.local()

# #For finding user global ip, that is internet ip address
# def user_ip():
# 	print "userip"
#   if hasattr(globals, 'ip'):
# 	print "yes"
# 	return globals.ip
#   else:
# 	return None

def global_activity(request):
	print "global_activity"
	# user_ip = globals.ip
	user_ip = request.META.get('HTTP_X_FORWARDED_FOR', request.META.get('REMOTE_ADDR', '127.0.0.1'))
	print "userip", user_ip
	if user_ip.startswith('127.0.0') or user_ip.startswith('192.168.1'):
		user_ip = '114.69.235.2'
		# user_ip  = '219.75.27.16'
	g = GeoIP()
	country = g.country_code(user_ip) #get country code from geo
	print "country", country
	city=g.city(user_ip)['city']    #get current city from geo
	print "city", city
	current_country_cities = City.objects.filter(country_code=country) # get current country cities from database
	print "current_country_cities", current_country_cities
	#store city if not available in database
	if not city:
		city = "Pondicherry" 
	if City.objects.filter(city=city).exists():
		city = City.objects.get(city=city)
		city_id=city.id
	else:
		country_code = country
		city_model = City()
		city_model.city = city
		city_model.country_code = country_code
		city_model.country_name = g.country_name(user_ip)
		city_model.save()
		city_id = city_model.id
	print "cityid", city_id
	#get global language from dictionary
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
		global_language = country_language_dict[country]
	else:
		selected_language = 'en'
		global_language = selected_language

	print "global_language", global_language

	path =  request.path
	category = Category.objects.all()
	subcategory = SubCategory.objects.all()
	recentad=Product.objects.filter().order_by('-id')[:3]

	#get authenticated user id
	if request.user.is_authenticated():
		userprofile=UserProfile.objects.get(user=request.user.id)
	else:
		userprofile=None
	 
	return {'country':country,'city': city,'current_country_cities':current_country_cities,
			'city_id':city_id,'language':global_language,'path':path,'category':category,
			'subcategory':subcategory, 'recentad':recentad,'user_det':userprofile,
			'user_ip':user_ip}