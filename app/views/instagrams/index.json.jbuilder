json.array!(@instagrams) do |instagram|
  json.extract! instagram, :id, :image_url, :location
  json.url instagram_url(instagram, format: :json)
end
