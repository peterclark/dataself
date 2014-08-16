json.array!(@instagrams) do |instagram|
  json.extract! instagram, :id, :image_url
  json.url instagram_url(instagram, format: :json)
end
