json.array!(@super_users) do |super_user|
  json.extract! super_user, :id, :name, :email
  json.url super_user_url(super_user, format: :json)
end
