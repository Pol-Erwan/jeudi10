require 'rubygems'
require 'nokogiri'
require 'open-uri'

URL = "https://coinmarketcap.com/"

def perform

	page = nokogiri (URL)

	list_symbol = page.xpath("//a[@class='currency-name-container link-secondary']")  #récup symbol
	    #puts list_symbol
	list_value = page.xpath("//a[@class='price']")                                    #récup valeur
            #puts list_value
        crypto_hash = Hash.new                                                            #créa new tabH
        
	crypto_hash = make_hash(list_symbol,list_value)                                   #récup tabH full
            #puts crypto_hash
	return
end

def nokogiri (path)
	return Nokogiri::HTML(open(path)) 
end

def make_hash (list_symbol,list_value)

        tempory_hash = Hash.new                                                           #créa new tabH
	#puts tempory_hash
        for a in 0..list_symbol.size-1 do                      #remplir temp h avec symb et value associé
                temp_hash = Hash.new
                tempory_hash[list_symbol[a].text]=list_value[a].text.delete('$')                     
                tempory_hash.each do |temp_hash|
                  print "{ #{temp_hash [0]}"
                  puts " => #{temp_hash [1]} },"
                end  
	end
            
        return tempory_hash                                                               #retour valeur H
end

perform

#h = crypto.zip(list_value).to_h
