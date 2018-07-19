require 'twitter'
require_relative 'townhalls_scrapper.rb'

def pro_twitter

  #On se connecte avec nos clefs =)
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ""
    config.consumer_secret     = ""
    config.access_token        = ""
    config.access_token_secret = ""
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
