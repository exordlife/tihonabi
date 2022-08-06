Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: 'homes#top'
  resources :posts, only: [:index, :new,:show, :create, :destroy]
  resources :users, only: [:show, :edit, :update]
  resources :genres, only:[:index, :create, :destroy, :update, :edit]
end
