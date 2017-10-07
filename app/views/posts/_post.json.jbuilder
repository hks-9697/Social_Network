json.extract! post, :id, :userid, :msg, :type_id, :created_at, :updated_at
json.url post_url(post, format: :json)
