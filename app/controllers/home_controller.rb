class HomeController < ApplicationController
  
  layout 'home'
  
  def index
    @instagrams = Instagram.recent(3)
    @automatics = Automatic.recent(3)
    @footballs  = Football.recent(6)
  end
  
end
