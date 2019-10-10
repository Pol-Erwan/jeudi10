require 'rubygems'
require 'nokogiri'
require 'open-uri'

URL = "https://www.annuaire-des-mairies.com/95/avernes.html"

def perform

	page = nokogiri (URL)
        list_mail = Hash.new
	list_mail = page.xpath("//a[contains(@href,'https://www.annuaire-des-mairies.com/95/avernes.html')]")
        
        #a[href*='://']	//a[contains(@href, '://')]
        puts list_mail.text
   
          
	return
end

def nokogiri (path)
	return Nokogiri::HTML(open(path)) 
end


def get_townhall_email(townhall_url)

end


perform


