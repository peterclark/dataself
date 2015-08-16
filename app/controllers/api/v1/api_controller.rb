class Api::V1::ApiController < RocketPants::Base
  version 1
  before_action :authenticate

  def authenticate
    error! :unauthenticated unless params[:secret] == Rails.application.secrets.api_secret
  end

end
