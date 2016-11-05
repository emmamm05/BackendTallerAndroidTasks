json.extract! task, :id, :created_at, :updated_at, :attachment_url, :user_id, :title, :detail
json.url task_url(task, format: :json)