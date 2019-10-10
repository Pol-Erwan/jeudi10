require 'rubygems'
require 'nokogiri'
require 'open-uri'

URL = "http://annuaire-des-mairies.com/95/sarcelles.html"

def perform

	page = nokogiri (URL)

	list_mail = page.xpath('//a[contains(@href, "mailto")]')
        
        puts list_mail.text
   
          
	return
end

def nokogiri (path)
	return Nokogiri::HTML(open(path)) 
end



perform


