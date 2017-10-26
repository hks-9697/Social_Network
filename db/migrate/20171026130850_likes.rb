class Likes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :post_id
    end
    drop_table :votes
  end
end
