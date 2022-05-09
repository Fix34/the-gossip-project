Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'gossips#index'
  get 'gossips/:id', to: 'gossips#show', as: 'gossip'
  get '/team', to: 'pages#team'
  get '/contact', to:'pages#contact'
end
