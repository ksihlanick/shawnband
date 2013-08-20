class VotesController < ApplicationController
  
  def index #should be password protected - fix this
    @votes = Vote.all
  end

  def create
    #@user = User.new(params[:user])
    @remoteip = request.remote_ip
    @vote = Vote.create
    @vote.set_vote_attributes(params[:vote])
  	if @vote.save
      flash[:success] = "Thanks so much!  We are one step closer to releasing our album.  Feel free to rate more songs:"
  		redirect_to root_path
      
  	else
  		render 'new'
  	end
  end

  def new
  	@allsongs = AWS::S3::Bucket.find(BUCKET).objects
  	@song1 = @allsongs.sample
  	@song2 = @allsongs.sample
  	if (@song1 == @song2)
  		@song2 = @allsongs.sample
  	end
  	@songs = [@song1,@song2]

  	@vote = Vote.new
  end

  def show
  end

end
