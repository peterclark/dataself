class HomeController < ApplicationController
  
  def index
    @instagrams = Instagram.recent_few.reverse
  end
  
end
