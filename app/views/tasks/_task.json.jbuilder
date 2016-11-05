json.extract! task, :id, :created_at, :updated_at, :attachment_url, :user_id
json.url task_url(task, format: :json)