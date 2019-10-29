Rails.application.routes.draw do
  devise_for :users
  root 'books#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :books, only: [:new, :create, :index, :show]
  resources :books

  resources :users

 get 'home/about' => 'books#about'

end