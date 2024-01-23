Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

  # resources: admin, only[:index, :create, :update, :destroy]
  get 'admin/index', to: 'admin#index', as: 'admin_index'
  # get 'admin/users/:id', to: 'admin#show', as: 'admin_users_show'
  post '/admin/users', to: 'admin#create', as: 'admin_users' 
  get '/admin/users', to: 'admin#create', as: 'admin_users_create' 
  patch '/admin/users/:id', to: 'admin#update', as: 'admin_users_update' 
  delete '/admin/users/:id', to: 'admin#destroy', as: 'admin_users_destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
