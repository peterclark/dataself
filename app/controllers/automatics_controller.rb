class AutomaticsController < ApplicationController
  before_action :set_automatic, only: [:show]

  def index
    @automatics = Automatic.recent(nil).page( params[:page] )
    respond_with(@automatics)
  end

  def show
    respond_with(@automatic)
  end

  private
    def set_automatic
      @automatic = Automatic.find(params[:id])
    end
end
