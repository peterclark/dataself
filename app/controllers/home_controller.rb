class HomeController < ApplicationController
  
  def index
    @instagrams = Instagram.recent_few
    @automatics = Automatic.recent_few
  end
  
end
