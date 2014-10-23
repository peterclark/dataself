class Api::V1::AutomaticsController < Api::V1::ApiController
  version 1
  
  before_action :set_automatic, only: [:show]

  def index
    @automatics = Automatic.page(params[:page])
    expose @automatics
  end

  def show
    expose @automatic
  end

  def create
    @automatic = Automatic.new(trip: automatic_params)
    @automatic.save
    expose @automatic
  end

  private
    def set_automatic
      @automatic = Automatic.find(params[:id])
    end

    def automatic_params
      params.require(:trip)
    end
end
