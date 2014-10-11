class InstagramsController < ApplicationController
  before_action :set_instagram, only: [:show]

  def index
    @instagrams = Instagram.page(params[:page]).recent(nil)
    respond_with(@instagrams)
  end

  def show
    respond_with(@instagram)
  end

  private
  
  def set_instagram
    @instagram = Instagram.find(params[:id])
  end
    
end
