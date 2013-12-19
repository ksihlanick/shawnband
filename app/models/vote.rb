class Vote < ActiveRecord::Base
  #attr_accessible :ip, :song1, :song2, :favsong, :comment


  #validates(:favsong, presence: true )
  validates_presence_of :comment, :if => :skipped_true?
  validates_presence_of :ip

  def set_vote_attributes(vote_hash)
    self.ip = vote_hash[:ip]
    self.song1 = vote_hash[:song1]
    self.song2 = vote_hash[:song2]
    if (vote_hash[:favsong] === "1")
      self.favsong = vote_hash[:song1]
    elsif (vote_hash[:favsong] === "2")
      self.favsong = vote_hash[:song2]
    else
      self.favsong = ''
    end

    self.name = vote_hash[:name]
    self.start_time = vote_hash[:start_time]

    self.comment = vote_hash[:comment]
  end

  def skipped_true?
    self.favsong === ''
  end

end