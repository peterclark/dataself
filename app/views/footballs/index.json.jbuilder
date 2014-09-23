json.array!(@footballs) do |football|
  json.extract! football, :id, :player, :team, :status, :player_url
  json.url football_url(football, format: :json)
end
