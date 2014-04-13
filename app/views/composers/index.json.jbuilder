json.array!(@composers) do |composer|
  json.extract! composer, :id, :name, :country
  json.url composer_url(composer, format: :json)
end
