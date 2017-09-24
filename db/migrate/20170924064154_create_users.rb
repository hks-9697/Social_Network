class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :userid , :null=>false , :unique=>true
      t.string :enc_password , :null=>false
      t.string :name
      t.date :bithdate
      t.string :sex
      t.string :address

      t.timestamps
    end
  end
end
