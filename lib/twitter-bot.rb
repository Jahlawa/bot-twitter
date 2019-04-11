require 'pry'
require 'dotenv'
require 'twitter'

Dotenv.load('../.env') 

def login_twitter
	

	@client = Twitter::REST::Client.new do |config|
		config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
		config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
		config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
		config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
	end
end

def bonjour
	moussaillons = ["@EHachei", "@bakin_pancakes", "@Truccc5", "@FralpsTHP", "@CRungette"]
	selection = moussaillons.sample(4)
	selection.each do |i|
		@client.update("Bande de chacals vous allez tous crever comme des chacals mais ca fais deux fois chacal #bonjour_monde ! #{i}")
	end
end

def like_bonjour 
	@client.search("#bonjour_monde", result_type: "recent").take(25).collect do |like|
		@client.favorite(like)

	end

	def follow_twitter

		
		@client.search.each("#bonjour_monde", result_type: "recent").take(20).collect do |follow|
			@client.follow(follow)
			"#{follow.user.screen_name}: #{"#bonjour_monde"}"
		end
	end

end

def perform
	login_twitter
	#bonjour
	#like_bonjour
	follow_twitter

end

perform