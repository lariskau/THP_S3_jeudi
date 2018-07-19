require 'gmail'


class Mailing


  USERNAME = 'husnot.a@gmail.com'
  PASSWORD = 'Aeiouyteam61'

  def global


    gmail = Gmail.connect(USERNAME, PASSWORD)

    edouard = ['edouard.plantevin@laposte.net', 'edouard.61@live.fr', 'bougaut.lea@gmail.com']
    edouard.each do |mail|
      gmail.deliver do
        to mail
        subject "Ruby c'est cool"
        html_part do
          content_type 'text/html; charset=UTF-8'
          body "<p>Bonjour,<br>
Je m'appelle Edouard, je suis élève à The Hacking Project, une formation au code gratuite,
sans locaux, sans sélection, sans restriction géographique.<br>
La pédagogie de nôtre école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code.<br>
Le proje
t du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.</p>

<p>Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de [NOM_COMMUNE] veut changer le monde avec nous ?</p>


<p>Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80</p>"
        end
        sleep(20)
        puts "Message envoyer"
      end
    end

    gmail.logout

  end

end

Mailing.new.global
