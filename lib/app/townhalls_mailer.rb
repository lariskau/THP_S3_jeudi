require 'gmail'
require 'dotenv'
#On se log à gmail =)
USERNAME = ENV['USERNAME']
PASSWORD = ENV['PASSWORD']

  def envoie_mail

    gmail = Gmail.connect(USERNAME, PASSWORD)
#petit rapel @town_emails recense toutes les adresses e-mails des mairies d'un département
#On créer une variable compte pour faire le décompte
compte = @town_emails.length
#On créer une boucle pour envoyer un mail à chaque mairies

    @town_emails.each do |mail|

      gmail.deliver do
      to mail
        subject "Apprendre à coder c'est cool"
        html_part do
        content_type 'text/html; charset=UTF-8'
          body "<p>Bonjour,<br>
            Je m'appelle Edouard, je suis élève à The Hacking Project, une formation au code gratuite,
            sans locaux, sans sélection, sans restriction géographique.<br>
            La pédagogie de nôtre école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code.<br>
            Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.</p>

            <p>Déjà 500 personnes sont passées par The Hacking Project. Est-ce que votre mairie veut changer le monde avec nous ?</p>

            <p>Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80</p>"
        end
        #Le fameux décompte
        compte = compte - 1
        #On le fait dormir un peu, au cas ou ^^
         sleep(20)
         puts "Message envoyer à #{mail} il ne reste plus que #{compte} à envoyer"
      end
    end

  gmail.logout #On se déco de gmail

  end
