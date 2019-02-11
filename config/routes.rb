Rails.application.routes.draw do

  root 'articles#index'
  resources :article_categories
  resources :categories
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
