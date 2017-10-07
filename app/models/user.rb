
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
end
