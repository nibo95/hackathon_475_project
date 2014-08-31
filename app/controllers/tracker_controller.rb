class TrackerController < ApplicationController
	before_filter :set_up

	def index
	end

	def new
	end

	private

	def set_up 
		@client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = "7ME154te3k4mEqZbm40rFnoMF"
		  config.consumer_secret     = "PwY2mX30U6cM2V92QufhfHfl78SGAkdmMD2b5azav9CAYllvgx"
		  config.access_token        = "2781162565-AuqjBetsk6FWiZXE5o0RkShEvY9DkR1lh4A4JIR"
		  config.access_token_secret = "2cFbjnWfm9wLrVpGnouFttswwcJSsn62bItQ41VJqbRAW"
		end

		temp = @client.search("#PalestineUnderAttack").map { |c| c.text }
		binding.pry
	end

end
