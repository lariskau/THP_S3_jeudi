require 'nokogiri'
require 'open-uri'
require 'json'

class Scrapping_townhals_61
	attr_accessor :name ,:email,:dep

	def initialize(name, email, dep)
		@name = name
		@email = email
		@dep = dep
	end
	#scrap du mail sur une page de mairie de l'annuaire
	 	
	 def get_the_email_of_a_townhal_from_its_webpage(url)
	 page = Nokogiri::HTML(open(url))
	 page.xpath('//body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
	 end

	def all_the_urls_of_orne_townhalls
		#création d'un tableau qui regroupe les urls de toutes les pages qui concerne l'orne:
		urls=%w[http://www.annuaire-des-mairies.com/morbihan.html]

	  	urls.each do |url|

	    doc = Nokogiri::HTML(open(url))
		    	
		    doc.css(".lientxt").each do |link|
			url = "http://annuaire-des-mairies.com" + link["href"][1..-1].to_s
			town_name = link.text
			town_email = get_the_email_of_a_townhal_from_its_webpage(url)
			town_hash = {:name => town_name, :email => town_email, :dep => "61" }

			end 
		end  
	puts town_hash
	end


		def scrap_to_json
		#on demande que le résultat s'inscrive dans un fichier.json précédamment créé.
		File.open('/home/manon/Documents/THP/Semaine_3/jeudi/db/list_of_townhalls.json',"w") do |f|
		f.write(all_the_urls_of_orne_townhalls.to_json)
		end
end 

Scrapping_townhals_61.new.initialize.all_the_urls_of_orne_townhalls.scrap_to_json