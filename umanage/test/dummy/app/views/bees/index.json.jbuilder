json.array!(@bees) do |bee|
  json.extract! bee, :id, :name, :email
  json.url bee_url(bee, format: :json)
end
