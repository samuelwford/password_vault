json.array!(@passwords) do |password|
  json.extract! password, :id, :name, :password, :notes, :group_id
  json.url password_url(password, format: :json)
end
