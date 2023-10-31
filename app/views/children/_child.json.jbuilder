json.extract! child, :id, :user_id, :birthday, :name, :gender, :created_at, :updated_at
json.url child_url(child, format: :json)
