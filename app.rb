require 'gmail'
require 'nokogiri'
require 'open-uri'
require 'csv'
require 'twitter'

require_relative 'lib/app/townhalls_mailer.rb'
require_relative 'lib/app/townhalls_follower.rb'
require_relative 'lib/app/townhalls_scrapper.rb'

puts "Bonjour les copains =)"
puts "Alors qui voulez-vous spamer aujourd'hui ?"
puts "1 => le Var"
puts "2 => la Manche"
puts "3 => le Calvados"
print "Taper '1' '2' ou '3' >"
choix = gets.chomp.to_s

  if choix == "1"
    get_all_the_urls_of_var #def qui se trouve dans "townhalls_scrapper"
  elsif choix == "2"
    get_all_the_urls_of_manche #def qui se trouve dans "townhalls_scrapper"
  elsif choix == "3"
    get_all_the_urls_of_morbihan #def qui se trouve dans "townhalls_scrapper"
  else
    puts "Non, 1, 2 ou 3 =)"
end
