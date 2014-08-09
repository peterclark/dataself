Rails.application.routes.draw do
  
  get 'home/index', as: :home
  
  root "home#index"

end
