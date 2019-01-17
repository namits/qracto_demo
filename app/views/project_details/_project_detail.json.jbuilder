json.extract! project_detail, :id, :name, :contact_no, :email, :country, :description, :created_at, :updated_at
json.url project_detail_url(project_detail, format: :json)
