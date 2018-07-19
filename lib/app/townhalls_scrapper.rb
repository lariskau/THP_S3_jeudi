require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'
require 'google_drive'
require 'dotenv'

require_relative 'townhalls_follower.rb'
require_relative 'townhalls_mailer.rb'
  def get_the_email_of_a_townhal_from_its_webpage(url)
      #Ouverture de l'url du site de la ville
      page = Nokogiri::HTML(open(url))
      #Scrapping des adresses e-mail
      page.xpath('//body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
  end

  def get_the_district(url)
    #Ouverture de l'url du site de la ville
    page = Nokogiri::HTML(open(url))
    #Scrapping du département
    page.xpath("//body/div/main/section[4]/div/table/tbody/tr[1]/td[2]").text
  end


#def pour scrapper toutes les mairies de la Manche
  def get_all_the_urls_of_manche
#On créé deux tableaux, 1 pour stocker les noms des maries, l'autre pour stocker les e-mails
    array = []

    @town_names = []
    @town_emails = []
    urls = %w[http://www.annuaire-des-mairies.com/manche.html http://www.annuaire-des-mairies.com/manche-2.html http://www.annuaire-des-mairies.com/manche-3.html]

    urls.each do |url|
    doc = Nokogiri::HTML(open(url))
    doc.css(".lientxt").each do |link|
      url = "http://annuaire-des-mairies.com" + link["href"][1..-1].to_s
      town_name = link.text
      town_email = get_the_email_of_a_townhal_from_its_webpage(url)
      town_district = get_the_district(url)
      ville = {:name => town_name, :email => town_email, :district => town_district}
      array << ville

      @town_names << town_name
      @town_emails << town_email
      end
    end

    array
    envoie_mail #Cette méthode se trouve dans townhalls_mailer.rb
    pro_twitter #Cette méthode se trouve dans townhalls_follower.rb
  end

  #On répète les mêmes def pour le Var et Morbihan


  def get_all_the_urls_of_var
    array = []

    @town_names = []
    @town_emails = []
    urls = %w[http://www.annuaire-des-mairies.com/var.html]

    urls.each do |url|
    doc = Nokogiri::HTML(open(url))
    doc.css(".lientxt").each do |link|
      url = "http://annuaire-des-mairies.com" + link["href"][1..-1].to_s
      town_name = link.text
      town_email = get_the_email_of_a_townhal_from_its_webpage(url)
      town_district = get_the_district(url)
      ville = {:name => town_name, :email => town_email, :district => town_district}
      array << ville

      @town_names << town_name
      @town_emails << town_email

      print @town_names
      end
      end
      array
      envoie_mail
      pro_twitter
      end




  def get_all_the_urls_of_morbihan
    array = []

    @town_names = []
    @town_emails = []
    urls = %w[http://www.annuaire-des-mairies.com/morbihan.html]

    urls.each do |url|
    doc = Nokogiri::HTML(open(url))
    doc.css(".lientxt").each do |link|
      url = "http://annuaire-des-mairies.com" + link["href"][1..-1].to_s
      town_name = link.text
      town_email = get_the_email_of_a_townhal_from_its_webpage(url)
      town_district = get_the_district(url)
      ville = {:name => town_name, :email => town_email, :district => town_district}
      array << ville

      @town_names << town_name
      @town_emails << town_email
      end
    end
    array
    envoie_mail
    pro_twitter
    end


#On envoie tout dans un beau spreadsheet accessible ici : https://docs.google.com/spreadsheets/d/1m5VF7W9d0NAtBSkAKh0mvJkcEaEJIA7vU-ATV7Q0iK8/edit?usp=sharing

  def spreadsheet(hash_array)

    session = GoogleDrive::Session.new|config|
      client_id = ENV['CLIENT_ID']
      client_secret = ENV['CLIENT_SECRET']
      scope = ENV['SCOPE']
      refresh_token = ENV['REFRESH_TOKEN'] 


    ws = session.spreadsheet_by_key("1m5VF7W9d0NAtBSkAKh0mvJkcEaEJIA7vU-ATV7Q0iK8").worksheets[0]
    i = 2
    # On donne des titres aux colonnes
    ws[1, 1] = "Nom de ville"
    ws[1, 2] = "Mail mairie"
    ws[1, 3] = "Département"

    # On écrit dans les colonnes les données
    hash_array.each do |hash|

      ws[i, 1] = hash[:name]
      ws[i, 2] = hash[:email]
      ws[i, 3] = hash[:district]
      ws.save
      i += 1
     end
  end