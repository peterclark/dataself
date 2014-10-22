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
    puts params.inspect
  end

  private
    def set_automatic
      @automatic = Automatic.find(params[:id])
    end

    def automatic_params
      params.require(:automatic).permit()
    end
end
