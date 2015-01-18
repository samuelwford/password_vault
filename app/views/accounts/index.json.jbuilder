json.array!(@accounts) do |account|
  json.extract! account, :id, :name, :password, :notes, :group_id, :account_name, :url
  json.url account_url(account, format: :json)
end
