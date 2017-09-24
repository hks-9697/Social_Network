json.extract! user, :id, :userid, :enc_password, :name, :bithdate, :sex, :address, :created_at, :updated_at
json.url user_url(user, format: :json)
