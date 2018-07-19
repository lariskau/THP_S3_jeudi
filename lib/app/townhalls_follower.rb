require 'twitter'
require 'dotenv'
require_relative 'townhalls_scrapper.rb'

def pro_twitter

  #On se connecte avec le .env
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV['CONFIG.CONSUMER_KEY']
    config.consumer_secret     = ENV['CONFIG.CONSUMER_SECRET']
    config.access_token        = ENV['CONFIG.ACCESS_TOKEN']
    config.access_token_secret = ENV['CONFIG.ACCESS_TOKEN_SECRET']
  end

#On créer un tableau qui va contenir les derniers utilisateurs qui on parlais de leurs mairies
  user_follow = []

  @town_names.each do |i|
    client.search("mairie #{i}", result_type: "recent").take(1).collect do |tweet|
      nom = "@#{tweet.user.screen_name}" #on rajoute un "@"
      user_follow << nom
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
end
