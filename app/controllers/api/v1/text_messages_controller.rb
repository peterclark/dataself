class Api::V1::TextMessagesController < Api::V1::ApiController
  version 1

  def create
    @text = text_message_params[:Text]
    
    case @text
    when /^automatic (.+)/
      @automatic = Automatic.create trip_map: $1
      expose @automatic
    when /^football (.+),(.+),(.+),(.+)/
      @football = Football.create player: $1, team: $2, status: $3, player_url: $4
    else
    end
  end

  private

    def text_message_params
      params.permit(:Text)
    end
    
end
