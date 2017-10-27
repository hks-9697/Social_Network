class SetUniqueCon < ActiveRecord::Migration[5.1]
  def change


    add_index :users, :userid, :unique => true
    add_index :friendships, [:userid1 , :userid2] ,:unique => true
    add_index :interests, [:userid , :interest_topic] , :unique => true


  end
end
