Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'homes#top'
  resources :posts, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  resources :genres, only:[:index, :create, :destroy, :update, :edit, :show]
  get 'congratulationscreate/:id' => 'posts#congratulationscreate', as: 'congratulationscreate'
  get 'congratulations' => 'posts#congratulations', as: 'congratulations'
end
