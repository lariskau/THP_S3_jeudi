require 'twitter'
require 'dotenv'
require_relative 'townhalls_scrapper.rb'
require 'google_drive'

def pro_twitter

  #On se connecte avec nos clefs =)
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV['CONFIG.CONSUMER_KEY']
    config.consumer_secret     = ENV['CONFIG.CONSUMER_SECRET']
    config.access_token        = ENV['CONFIG.ACCESS_TOKEN']
    config.access_token_secret = ENV['CONFIG.ACCESS_TOKEN_SECRET']
  end


  town_names = ["Acqueville", "Agneaux", "Agon Coutainville", "Airel", "Amfreville", "Amigny", "Ancteville", "Caen"]
#On créer un tableau qui va contenir les derniers utilisateurs qui on parlais de leurs mairies
  user_follow = []

  town_names.each do |i|
    client.search("mairie #{i}", result_type: "recent").take(1).collect do |tweet|
      nom = "@#{tweet.user.screen_name}" #on rajoute un "@"
      user_follow << nom
#On enregistre les handles dans le googles spreadsheet accessible ici : https://docs.google.com/spreadsheets/d/1m5VF7W9d0NAtBSkAKh0mvJkcEaEJIA7vU-ATV7Q0iK8/edit?usp=sharing
#      session = GoogleDrive::Session.from_config("config.json")
#      ws = session.spreadsheet_by_key("1m5VF7W9d0NAtBSkAKh0mvJkcEaEJIA7vU-ATV7Q0iK8").worksheets[0]
#      i = 2

#      user_follow.each do |user|
#      ws[i, 4] = user
#      ws.save
#      i += 1
#      end
    end
  end


#On créer une boucle qui va follow chaque personne du array user_follow
  user_follow.each do |single_user|
    single_user[0] = ''
    begin
      client.follow!(single_user)
      puts "Vous venez de follow #{single_user}"
    rescue Exception, NotFound, Forbidden #Evite que le programme s'arrete quand il ne trouve rien
    next
    end
  end
  puts user_follow
end

pro_twitter
