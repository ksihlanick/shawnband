class Vote < ActiveRecord::Base
  attr_accessible :ip, :song1, :song2, :favsong, :comment

  def set_vote_attributes(vote_hash)
    self.ip = vote_hash[:remoteip]
    self.song1 = vote_hash[:song1]
    self.song2 = vote_hash[:song2]
    if (vote_hash[:favsong] == 1)
    	self.favsong = vote_hash[:song1]
    else
    	self.favsong = vote_hash[:song2]
    end
    self.comment = vote_hash[:comment]
  end

end