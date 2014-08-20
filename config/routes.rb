Rails.application.routes.draw do
  
  resources :githubs, only: [:show, :index]
  resources :instagrams, only: [:show, :index]
  
  namespace 'api' do
    api versions: 1, module: "v1" do
      resources :instagrams, only: [:show, :index, :create]  
      resources :githubs, only: [:show, :index, :create]
    end
  end

  get 'home/index', as: :home
  
  root "home#index"

end
