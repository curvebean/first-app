Rails.application.routes.draw do
  root 'home#home'
  get '/about', to: 'home#about'
  
  devise_for :users, controllers:{
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords'
  }

  resources :users ,only: [:index,:show]
  get "users/:id/likes" => "users#likes"
  resources :posts
  resources :likes, except: [:new,:edit,:update]
  resources :friends, only: [:create,:destroy]
  get "friends/post_index" => "friend#post_index"
  resources :talks
  get "users/:id/show/talks" => "talks#show_all"

  get '*path' => redirect("/")
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
