Rails.application.routes.draw do

  resources :users
  root 'articles#index'
  resources :article_categories
  resources :categories
  resources :articles


  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
