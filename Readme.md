# Envoi d'emails en masse et bot twitter   

  
Projet dans le cadre de la session 5 semaine 3 de THP des équipe de Flers et Lille.  
  
### l'équipe:  
--------

*les normands Léa ( reine du scrapping) et Edouard ( superdev 2.0)  
*les nordistes Maxime ( chef d'orchestre pour bots) et Manon ( nottament rédactrice de readme )  

Projet réalisé à distance ( because... c'est pas la porte d'à côté) mais dans la joie et bonne humeur!

## Fonctions du programme:  
-----------------------
*__Scrapping__ d'adresses mails de mairies de trois départements ( la Manche, le Var et le Morbihan) et les stocke dans un __fichier .csv__.  
*utilisation de ces informations pour __envoyer un mail__ via bot afin de promouvoir thp.   
*scrapping __d'handles twitter__ des mêmes mairies afin de les __follow via bot__.  

## Comment lancer le programme?             
*Cloner ce repositorie.  
*Effectuer la commande dans votre terminal positionné dans le dossier que vous avait cloné "$ bundle install" afin que les gem nécessaires au programme.  
*Ajoutez un fichier .env à la racine du dossier dans lequel vous noterez vos clés d'API pou Twitter, googledrive et Gmail  
*Lancer le programme app.rb avec la commande " ruby app.rb"  
*Laisser vous guider :)  

## Utilité des différents fichiers et dossiers

*le dossier db contient les donnés scrappés dans un fichier 'townhalls.csv' qui contient les donnés scappés ( nom des communes et mails) des départements Manche, Morbihan et Var.  
*le dossier lib qui contient les différentes fonctions qui composent ce programme rangées en sous-dossiers:   
	*app qui contient les principales actions du programmes:(townhalls_scrapper.rb qui a sert à récupérer le nom et l'adresse mails des mairies des départements cibles; townhalls_mailer.rb dont le rôle est d'envoyer un même mail à toutes les mairies des départements cible en uttilisant les donnés scrappés et townhalls_follower.rb qui follow les le premier compte qui revient sur twitter si on cherche le nom des communes scrapper.  
	* views qui contient index.rb qui permet de naviguer dans le programme en proposant des 	choix à l'utilisateur  
*le fichier app.rb qui sert à lancer tout les autres programmes  
*le gemfile afin d'avoir les gems nécessaires au lancement du programme  
*.gitignore qui permet que certains fichiers qui contiennent des données sensibles tels que le dotenv ne soit pas envoyer par erreur sur github.  

## Fonctionnement 
 
Navigation par choix multiples.

## Gems utilisées:

*La gem 'nokogiri': qui sert à scrapper ( récupérer) les données d'un site internet en uttilisant nottament le css des pages web.  
*La gem 'google_drive'afin d'obtenir un fichier .cvs donc format tableur pour une lecture facile des donnés scrappés  
*La gem 'gmail' pour permettre l'envoi du mail via une adresse mail gmail  
*La gem 'twitter' pour uttiliser un compter twitter qui puisse follow les handles dont le nom est revenu en premier dans les recherches des noms des communes  
*La gem 'dotenv'qui permet d'appeller des données sensibles stockées dans un fichier .env ( exemple les clefs API)  

## Résultats:

Voici le mail envoyé par le bot à __.... mairies__.  
>"Bonjour,
>            Je m'appelle Edouard, je suis élève à The Hacking Project, une formation au code gratuite,
>            sans locaux, sans sélection, sans restriction géographique.
            La pédagogie de nôtre école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code.
>            Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.

>          Déjà 500 personnes sont passées par The Hacking Project. Est-ce que votre mairie veut changer le monde avec nous ?

>            Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80"  

Le handle utilisé pour follow les handles récupérés est __@coeur_satan__.
