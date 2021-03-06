Rails.application.routes.draw do

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'gossips#index'
  get '/team', to: 'pages#team'
  get '/contact', to:'pages#contact'
  get '/salut/:id', to:'pages#salut'
  resources :gossips do
    resources :comments
  end
  resources :users
  resources :cities
  resources :sessions, only:[:new, :create, :destroy]

end
