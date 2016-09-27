Rails.application.routes.draw do
  root to: "sessions#new"

  get '/ambassadors', to: 'users#ambassadors'
  get '/samplevendors', to: 'users#samplevendors'
  post '/admin', to: 'roles#admin'
  post '/member', to: 'roles#member'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create', as: :post_login
  delete '/logout', to: 'sessions#destroy'

  resources :users

  resources :roles, only: [:new, :create]

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

  resources :categories, only: [:index]
  
  resources :locations, only: [:index]
  get 'locations/all', to: 'locations#all'

  namespace :admin do
    resources :users
  end


  get '', to: 'sessions#new'

end
