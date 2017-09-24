class CreateChatboxes < ActiveRecord::Migration[5.1]
  def change
    create_table :chatboxes do |t|
      t.string :userfrom
      t.string :userto
      t.string :msg
      t.integer :type

      t.timestamps
    end
  end
end
