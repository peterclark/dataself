Bitly.use_api_version_3

Bitly.configure do |b|
  b.api_version = 3
  b.access_token = Rails.application.secrets.bitly_access_token
end