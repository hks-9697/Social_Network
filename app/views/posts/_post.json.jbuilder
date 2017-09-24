json.extract! post, :id, :userid, :msg, :type, :created_at, :updated_at
json.url post_url(post, format: :json)
