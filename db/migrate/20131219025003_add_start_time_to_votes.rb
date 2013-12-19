class AddStartTimeToVotes < ActiveRecord::Migration
  def change
  	add_column :votes, :start_time, :datetime
  end
end
