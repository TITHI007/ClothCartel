Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :registrations, only: [:new, :create]
  get '/signup' => 'registrations#new', as: 'signup'
  get '/login' => 'sessions#new', as: 'login'
  get '/logout' => 'sessions#destroy', as: 'logout'
  post '/api-keys', to: 'api_keys#create'
  delete '/api-keys', to: 'api_keys#destroy'
  get '/api-keys', to: 'api_keys#index'
  root to: 'cloths#index'
  resources :cloths do
    resources :feedbacks, only: [:create, :destroy]
  end

  
    
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  namespace :api, default: {format: 'json'} do
    get 'cloths/search', to: 'cloths#search'
    resources :cloths
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
