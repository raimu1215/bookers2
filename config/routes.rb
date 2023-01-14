Rails.application.routes.draw do
    devise_for :users
  root to: 'homes#top'
  get "homes/about" => "homes#about", as: "about"
  patch 'books/:id' => 'books#update', as: 'update_book'
#   resources :post_images, only: [:new, :create, :index, :show, :destroy]
  resources :books, only: [:new, :index, :show, :edit, :create, :update, :destroy]
  resources :users, only: [:show, :index, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
