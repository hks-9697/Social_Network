class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
      t.string :userid1 ,:null=>false
      t.string :userid2 ,:null=>false
      t.integer :status

      t.timestamps
    end
  end
end
