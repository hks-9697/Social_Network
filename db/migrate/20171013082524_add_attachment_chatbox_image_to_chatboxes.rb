class AddAttachmentChatboxImageToChatboxes < ActiveRecord::Migration[5.0]
  def self.up
    change_table :chatboxes do |t|
      t.attachment :chatbox_image
    end
  end

  def self.down
    remove_attachment :chatboxes, :chatbox_image
  end
end
