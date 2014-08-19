Rails.application.routes.draw do
  
  resources :githubs, only: [:show, :index]

  resources :instagrams, only: [:show, :index] do
    collection do
      get :recent
    end
  end
  
  namespace 'api' do
    api versions: 1, module: "v1" do
      resources :instagrams, only: [:show, :index, :create]  
      resources :githubs, only: [:show, :index, :create] do
        collection do
          get :commits_by_day
        end
      end
    end
  end

  get 'home/index', as: :home
  
  root "home#index"

end
