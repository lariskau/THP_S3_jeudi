require 'nokogiri'
require 'open-uri'
require 'csv'

require_relative 'townhalls_follower.rb'
require_relative 'townhalls_mailer.rb'
  def get_the_email_of_a_townhal_from_its_webpage(url)
      #Open the web page
      page = Nokogiri::HTML(open(url))
      #Scrap the e-mail address
      page.xpath('//body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
  end

#def pour scrapper toutes les mairies de la Manche
  def get_all_the_urls_of_manche
#On créer deux tableau, 1 pour stocker les noms des maries, l'autre pour stocker les e-mails
    @town_names = []
    @town_emails = []
    urls = %w[http://www.annuaire-des-mairies.com/manche.html http://www.annuaire-des-mairies.com/manche-2.html http://www.annuaire-des-mairies.com/manche-3.html]

    urls.each do |url|
    doc = Nokogiri::HTML(open(url))
  	doc.css(".lientxt").each do |link|
  		url = "http://annuaire-des-mairies.com" + link["href"][1..-1].to_s
  		town_name = link.text
  		town_email = get_the_email_of_a_townhal_from_its_webpage(url)
      @town_names << town_name
      @town_emails << town_email
      end
    end

  #On répete les mêmes def pour le Var et Morbihan 

  def get_all_the_urls_of_var
    @town_names = []
    @town_emails = []
    urls = %w[http://www.annuaire-des-mairies.com/var.html]

    urls.each do |url|
    doc = Nokogiri::HTML(open(url))
    doc.css(".lientxt").each do |link|
      url = "http://annuaire-des-mairies.com" + link["href"][1..-1].to_s
      town_name = link.text
      town_email = get_the_email_of_a_townhal_from_its_webpage(url)
      @town_names << town_name
      @town_emails << town_email
      end
    end
    envoie_mail
    pro_twitter
  end


  def get_all_the_urls_of_morbihan
    @town_names = []
    @town_emails = []
    urls = %w[http://www.annuaire-des-mairies.com/morbihan.html]

    urls.each do |url|
    doc = Nokogiri::HTML(open(url))
    doc.css(".lientxt").each do |link|
      url = "http://annuaire-des-mairies.com" + link["href"][1..-1].to_s
      town_name = link.text
      town_email = get_the_email_of_a_townhal_from_its_webpage(url)
      @town_names << town_name
      @town_emails << town_email
      end
    end
    envoie_mail
    pro_twitter
end
