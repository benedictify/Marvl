Rails.application.routes.draw do
  root to: "sessions#index"

  get '/ambassadors', to: 'users#ambassadors'
  get '/samplevendors', to: 'users#samplevendors', as: :samplevendors
  post '/admin', to: 'roles#admin'
  post '/member', to: 'roles#member'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create', as: :post_login
  delete '/logout', to: 'sessions#destroy'
  get '/forum', to: 'posts#forum'
  get '/reviews', to: 'reviews#index'
  get '/documents/:id/download', to: 'documents#download', as: :download

  resources :users 

  resources :documents, only: [:new, :create, :index, :show, :destroy]

  resources :roles, only: [:new, :create]

  resources :posts, only: [:new, :create, :edit, :update]

  resources :privacy, only: [:edit, :update]

  resources :vendors do
    resources :reviews do
      resources :votes
    end
    resources :offerings
  end

  # resources :reviews do
  #   resources :votes
  # end

  resources :categories, only: [:index, :show]

  get 'locations/all', to: 'locations#all'
  resources :locations, only: [:index, :show, :all]

  namespace :admin do
    resources :vendors
    resources :users do
      resources :roles
    end
  end


  get '', to: 'sessions#new'

end
