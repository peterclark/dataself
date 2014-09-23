class FootballsController < ApplicationController
  before_action :set_football, only: [:show, :edit]

  def index
    @footballs = Football.recent(6)
    respond_with(@footballs)
  end

  def show
    respond_with(@football)
  end
  
  private
  
  def set_football
    @football = Football.find(params[:id])
  end

end
