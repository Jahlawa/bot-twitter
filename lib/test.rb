require 'dotenv' # Appelle la gem Dotenv
require 'twitter'

Dotenv.load('../.env') # Ceci appelle le fichier .env (situé dans le même dossier que le programme Ruby) grâce à la gem Dotenv, et importe toutes les données enregistrées dans un hash ENV

def login_twitter
	
# Il est ensuite très facile d'appeler les données du fichier .env, par exemple là je vais afficher le contenu de la clé TWITTER_API_SECRET
client = Twitter::REST::Client.new do |config|
	config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
	config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
	config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
	config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end
end
# tout est stocké dans un hash qui s'appelle ENV. Tu peux le regarder en faisant 
client.update('Mon premier tweet en Ruby !!!!')