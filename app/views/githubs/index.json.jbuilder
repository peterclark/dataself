json.array!(@githubs) do |github|
  json.extract! github, :id, :commit_url
  json.url github_url(github, format: :json)
end
