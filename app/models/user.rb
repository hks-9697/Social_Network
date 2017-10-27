class User < ApplicationRecord
  def authenticate str
    p BCrypt::Engine.hash_secret(str,"$2a$12$0Xjo7FBV64NEuofhrp2O0.",userid)
    p enc_password
    if enc_password == BCrypt::Engine.hash_secret(str,"$2a$12$0Xjo7FBV64NEuofhrp2O0.",userid)
      return true
    else
      return false
    end
  end

  has_attached_file :image, :styles => { large: "600x600>", medium: "300x300>", thumb: "100x100#"}, :default_url => ActionController::Base.helpers.asset_path('missing.png')
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


end
