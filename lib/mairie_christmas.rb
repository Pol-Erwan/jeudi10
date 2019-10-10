require 'rubygems'
require 'nokogiri'
require 'open-uri'

def perform

        page
        townhall(page)
        get_townhall_urls(page)
        get_townhall_email
        townhall = townhall(page)
        townhall_email = get_townhall_email
        hashage2(townhall_email,townhall)
end

def page
	return page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
end

def townhall(page)
  townhall = page.xpath("//a[@class='lientxt']/text()")
  #puts townhall
  return townhall
end

def get_townhall_urls(page)
  url = page.xpath("//a[@class='lientxt']")
  tableau = []
  url.each do |townhall_url|
      tableau << "http://annuaire-des-mairies.com/" + townhall_url['href']
  end
  #puts tableau
  return tableau #je met tout les mail dans un tableau
end


def get_townhall_email
  i=0
  table = get_townhall_urls(page)
  townhall_email = []
  while i < table.length
    page2 = Nokogiri::HTML(open(table[i]))# ouverture d'une nouvelle page pour chaque élément du tableau
    townhall_email << page2.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]/text()")
    i += 1
  end
  #puts townhall_email
  return townhall_email
end

def hashage2 (townhall_email,townhall)

        tempory_hash = Hash.new                                                           #créa new tabH
	
        for a in 0..townhall.size-1 do                      
                temp_hash = Hash.new
                tempory_hash[townhall[a].text]=townhall_email[a].text                     
                tempory_hash.each do |temp_hash|
                  print "{ #{temp_hash [0]}"
                  puts " => #{temp_hash [1]} },"
                end  
	end  
        return tempory_hash                                                               #retour valeur H
end

perform


