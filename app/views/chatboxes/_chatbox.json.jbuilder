json.extract! chatbox, :id, :userfrom, :userto, :msg, :type_id, :created_at, :updated_at
json.url chatbox_url(chatbox, format: :json)
