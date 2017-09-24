class CreateInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :interests do |t|
      t.string :userid
      t.string :interest_topic

      t.timestamps
    end
  end
end
