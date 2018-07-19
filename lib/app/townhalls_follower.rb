require 'twitter'

class Bonjour

      @@client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ""
        config.consumer_secret     = ""
        config.access_token        = ""
        config.access_token_secret = ""
      end

      @@user_follow = []
      @@mairie = ["flers", "alençon", "caen", "marseille", "lille"]

def handle
      @@mairie.each do |i|
        @@client.search("mairie #{i}", result_type: "recent").take(1).collect do |tweet|
          nom = "@#{tweet.user.screen_name}"
          @@user_follow << nom
         end
      end
end

def follow
      @@user_follow.each do |single_user|
        single_user[0] = ''
        begin
          @@client.follow!(single_user)
          puts "Vous venez de follow #{single_user}"
        rescue Exception, NotFound, Forbidden
        next
        end
      end
end


end

Bonjour.new.handle
Bonjour.new.follow
