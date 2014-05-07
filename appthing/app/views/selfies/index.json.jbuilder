json.array!(@selfies) do |selfy|
  json.extract! selfy, :id, :description, :source_url
  json.url selfy_url(selfy, format: :json)
end
