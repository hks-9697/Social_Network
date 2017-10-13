class Chatbox < ApplicationRecord
  has_attached_file :chatbox_image
  validates_attachment_content_type :chatbox_image, content_type: /\Aimage\/.*\Z/
end
