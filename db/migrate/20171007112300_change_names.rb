class ChangeNames < ActiveRecord::Migration[5.1]
    def change
      rename_column :posts, :type, :type_id
      rename_column :chatboxes, :type, :type_id

    end
end
