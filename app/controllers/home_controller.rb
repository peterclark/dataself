class HomeController < ApplicationController
  
  def index
    @instagrams = Instagram.recent_few
  end
  
end
