class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|

      t.string :ip
      t.string :song1
      t.string :song2
      t.string :favsong
      t.string :comment
      t.timestamps
    end
  end
end
