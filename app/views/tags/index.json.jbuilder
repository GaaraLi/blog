json.array!(@tags) do |tag|
  json.extract! tag, :id, :name, :deleted_at
  json.url tag_url(tag, format: :json)
end
