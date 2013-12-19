class AddNameToVotes < ActiveRecord::Migration
  def change
  	add_column :votes, :name, :string
  end
end
