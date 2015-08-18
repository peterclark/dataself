class Api::V1::ApiController < RocketPants::Base
  version 1
  before_action :authenticate, only: [:create]

  def authenticate
    error! :unauthenticated unless params[:secret] == Rails.application.secrets.api_secret
  end

end
