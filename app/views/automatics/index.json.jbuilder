json.array!(@automatics) do |automatic|
  json.extract! automatic, :id, :trip_map
  json.url automatic_url(automatic, format: :json)
end
