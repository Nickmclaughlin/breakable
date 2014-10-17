Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :users do
    resources :posts do
      resources :responses
    end
    resources :photos
    post 'nudge', to: "users#nudge"
    delete 'nudge_delete', to: "users#nudge_delete"
  end

  namespace :admin do
    resources :users do
      resources :posts
      resources :photos
    end
  end
end
