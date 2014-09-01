class TrackerController < ApplicationController

	def index
	end

	def new
	end

	def generate
		@client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = "7ME154te3k4mEqZbm40rFnoMF"
		  config.consumer_secret     = "PwY2mX30U6cM2V92QufhfHfl78SGAkdmMD2b5azav9CAYllvgx"
		  config.access_token        = "2781162565-AuqjBetsk6FWiZXE5o0RkShEvY9DkR1lh4A4JIR"
		  config.access_token_secret = "2cFbjnWfm9wLrVpGnouFttswwcJSsn62bItQ41VJqbRAW"
		end

		@hours = { "00" => 0, "01" => 0, "02" => 0, "03" => 0, "04" => 0, "05" => 0, "06" => 0, "07" => 0, "08" => 0, "09" => 0, "10" => 0, "11" => 0, 
			"12" => 0, "13" => 0, "14" => 0, "15" => 0, "16" => 0, "17" => 0, "18" => 0, "19" => 0, "20" => 0, "21" => 0, "22" => 0, "23" => 0,  }
		tweets = @client.search('#' + params[:hashtag].to_s + " since:#{params[:start_date]} until:#{(params[:start_date].to_date + 1.day).to_s}").map { |c| c.created_at }
		temp = nil
		tweets.each do |tweet|
			if tweet.to_date > (params[:start_date].to_date + 1.day)
				tweets.delete(tweet)
			elsif tweet.to_s[11, 2] != temp
				temp = tweet.to_s[11, 2]
				@hours[temp] += 1
			else
				@hours[temp] += 1
			end
		end
	end
		

end
