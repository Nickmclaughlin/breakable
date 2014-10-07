Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :users do
    resources :posts
    resources :photos
  end
end
