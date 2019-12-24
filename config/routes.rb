Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tlks#index'

  get '/tlk/:id', to: 'tlks#show'
  resources :messages
  # resources :tlks do
  #   resources :messages, shallow: true
  # end
end
