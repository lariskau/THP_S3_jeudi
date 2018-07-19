require 'nokogiri'
require 'open-uri'
 #require 'csv'

class Scrapping_townhals_61
 attr_accessor :name ,:email,:dep

def initialize
	name= @name
	email= @email
	dep= @dep
end
#scrap du mail sur une page de mairie de l'annuaire
 	def get_the_email_of_a_townhal_from_its_webpage(url)
    page = Nokogiri::HTML(open(url))
    page.xpath('//body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
  	end

  			def all_the_urls_of_orne_townhalls
  				#création d'un tableau qui regroupe les urls de toutes les pages qui concerne l'orne:
  				urls=%w[http://annuaire-des-mairies.com/orne.html,
  					http://annuaire-des-mairies.com/orne-2.html]

  				urls.each do |url|
    	 		doc = Nokogiri::HTML(open())
	    		doc.css(".lientxt").each do |link|
					url = "http://annuaire-des-mairies.com" + link["href"][1..-1].to_s
					town_name = link.text
					town_email = get_the_email_of_a_townhal_from_its_webpage(url)
					town_hash = {:name => town_name, :email => town_email, :dep => "61" }
        		puts town_hash
      			
     	 	end
end
