Rails.application.routes.draw do
  
  resources :footballs,   only: [:show, :index]
  resources :automatics,  only: [:show, :index]
  resources :githubs,     only: [:show, :index]
  resources :instagrams,  only: [:show, :index]
  
  namespace 'api' do
    api versions: 1, module: "v1" do
      resources :text_messages, only: [:create]
      resources :instagrams, only: [:show, :index, :create]
      resources :automatics, only: [:show, :index, :create]
      resources :githubs, only: [:show, :index, :create] do
        collection do
          get :commits_by_day
        end
      end
    end
  end

  get '/about', to: 'pages#about', as: :about
  get '/resume', to: 'pages#resume', as: :resume
  
  get 'home/index', as: :home
  
  root "home#index"

end
