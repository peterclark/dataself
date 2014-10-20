class Api::V1::TextMessagesController < Api::V1::ApiController
  version 1

  def create
    @text = text_message_params[:Text]
    
    case @text
    when /^automatic (.+),(.+),(.+),(.+),(.+)/
      @automatic = Automatic.create avg_mpg: $1, miles: $2, duration: $3, fuel_volume: $4, trip_map: $5
      expose @automatic
    when /^football (.+),(.+),(.+),(.+)/
      @football = Football.create player: $1, team: $2, status: $3, player_url: $4
      expose @football
    else
    end
  end

  private

    def text_message_params
      params.permit(:Text)
    end
    
end
