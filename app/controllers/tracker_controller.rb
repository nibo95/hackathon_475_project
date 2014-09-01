class TrackerController < ApplicationController

	def index
	end

	def generate
		@client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = "7ME154te3k4mEqZbm40rFnoMF"
		  config.consumer_secret     = "PwY2mX30U6cM2V92QufhfHfl78SGAkdmMD2b5azav9CAYllvgx"
		  config.access_token        = "2781162565-AuqjBetsk6FWiZXE5o0RkShEvY9DkR1lh4A4JIR"
		  config.access_token_secret = "2cFbjnWfm9wLrVpGnouFttswwcJSsn62bItQ41VJqbRAW"
		end

		hours = { "00" => 0, "01" => 0, "02" => 0, "03" => 0, "04" => 0, "05" => 0, "06" => 0, "07" => 0, "08" => 0, "09" => 0, "10" => 0, "11" => 0, 
			"12" => 0, "13" => 0, "14" => 0, "15" => 0, "16" => 0, "17" => 0, "18" => 0, "19" => 0, "20" => 0, "21" => 0, "22" => 0, "23" => 0,  }
		@data = { "12:00am" => 0, "1:00am" => 0, "2:00am" => 0, "3:00am" => 0, "4:00am" => 0, "5:00am" => 0, "6:00am" => 0, "7:00am" => 0, "8:00am" => 0, "9:00am" => 0, "10:00am" => 0, "11:00am" => 0, 
			"12:00pm" => 0, "1:00pm" => 0, "2:00pm" => 0, "3:00pm" => 0, "4:00pm" => 0, "5:00pm" => 0, "6:00pm" => 0, "7:00pm" => 0, "8:00pm" => 0, "9:00pm" => 0, "10:00pm" => 0, "11:00pm" => 0,  }
		tweets = @client.search('#' + params[:hashtag].to_s + " since:#{params[:start_date]} until:#{(params[:start_date].to_date + 1.day).to_s}").map { |c| c.created_at }
		temp = nil
		tweets.each do |tweet|
			if tweet.to_date > (params[:start_date].to_date + 1.day)
				tweets.delete(tweet)
			elsif tweet.to_s[11, 2] != temp
				temp = tweet.to_s[11, 2]
				hours[temp] += 1
			else
				hours[temp] += 1
			end
		end
		@data["12:00am"] = hours["20"]
		@data["1:00am"] = hours["21"]
		@data["2:00am"] = hours["22"]
		@data["3:00am"] = hours["23"]
		@data["4:00am"] = hours["00"]
		@data["5:00am"] = hours["01"]
		@data["6:00am"] = hours["02"]
		@data["7:00am"] = hours["03"]
		@data["8:00am"] = hours["04"]
		@data["9:00am"] = hours["05"]
		@data["10:00am"] = hours["06"]
		@data["11:00am"] = hours["07"]
		@data["12:00pm"] = hours["08"]
		@data["1:00pm"] = hours["09"]
		@data["2:00pm"] = hours["10"]
		@data["3:00pm"] = hours["11"]
		@data["4:00pm"] = hours["12"]
		@data["5:00pm"] = hours["13"]
		@data["6:00pm"] = hours["14"]
		@data["7:00pm"] = hours["15"]
		@data["8:00pm"] = hours["16"]
		@data["9:00pm"] = hours["17"]
		@data["10:00pm"] = hours["18"]
		@data["11:00pm"] = hours["19"]
	end
		
end
