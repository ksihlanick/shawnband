class WelcomeController < ApplicationController
  def index
  	@allsongs = AWS::S3::Bucket.find(BUCKET).objects
  	@song1 = @allsongs.sample
  	@song2 = @allsongs.sample
  	if (@song1 == @song2)
  		@song2 = @allsongs.sample
  	end
  	@songs = [@song1,@song2]
  end
end
