class VotesController < ApplicationController

  def create
    @vote = Vote.create

    if params[:commit] == "Left!"
      params[:vote].merge!(:favsong => '1')
    elsif params[:commit] == "Right!"
      params[:vote]
      params[:vote].merge!(:favsong => '2')
    elsif params[:commit] == "Skip!"
      params[:vote]
      params[:vote].merge!(:favsong => '3')
    else
    end

    @vote.set_vote_attributes(params[:vote])
  	
    if @vote.save
      flash[:success] = "Thanks so much!  We are one step closer to releasing our album.  Feel free to rate more songs:"
  		redirect_to root_path
  	else
      redirect_to root_path
  	end
  end

  def new
  	@remoteip = request.remote_ip
  	@allsongs = AWS::S3::Bucket.find(BUCKET).objects
  	@song1 = @allsongs.sample
  	@allsongs.delete(@song1)
  	@song2 = @allsongs.sample
  	# if (@song1 == @song2)
  	# 	@song2 = @allsongs.sample
  	# end
  	@songs = [@song1,@song2]

  	@vote = Vote.new
  end

  def show
  end

end
