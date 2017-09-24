class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :userid
      t.string :msg
      t.integer :type

      t.timestamps
    end
  end
end
