class Api::V1::ApiController < RocketPants::Base
  version 1

  def authenticate
    error! :unauthenticated unless params[:secret] == Rails.application.secrets.api_secret
  end

end
