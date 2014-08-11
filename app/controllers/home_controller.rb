class HomeController < ApplicationController
  
  def index
    @instagrams = Instagram.limit 4
  end
  
end
