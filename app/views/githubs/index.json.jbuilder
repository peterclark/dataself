json.array!(@githubs) do |github|
  json.extract! github, :id, :commit_url, :commit_time
  json.url github_url(github, format: :json)
end
