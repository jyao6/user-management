json.array!(@posts) do |post|
  json.extract! post, :id, :content, :author
  json.url post_url(post, format: :json)
end
