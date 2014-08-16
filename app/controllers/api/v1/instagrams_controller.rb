class Api::V1::InstagramsController < Api::V1::ApiController
  version 1
  
  before_action :set_instagram, only: [:show]

  def index
    @instagrams = Instagram.all
    expose @instagrams
  end

  def show
    expose @instagram
  end

  def create
    image_url = params[:image_url] 
    @instagram = Instagram.new(image_url: image_url)
    @instagram.save
    expose @instagram
  end

  private
    def set_instagram
      @instagram = Instagram.find(params[:id])
    end

    def instagram_params
      params.require(:instagram).permit(:image_url)
    end
end
