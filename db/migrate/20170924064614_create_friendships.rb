class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
      t.string :userid1 ,:null=>false , :unique=>true
      t.string :userid2 ,:null=>false , :unique=>true
      t.integer :status

      t.timestamps
    end
  end
end
