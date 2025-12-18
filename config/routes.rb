Rails.application.routes.draw do
  root "products#index"

  get  "signup", to: "registrations#new"
  post "signup", to: "registrations#create"
  get  "login",  to: "sessions#new"
  post "login",  to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :products, only: %i[index show] do
    resources :reviews, only: %i[create]
  end
  resources :categories, only: %i[show]

  resource :cart, only: %i[show] do
    post   "add/:product_id",    to: "carts#add",    as: :add
    patch  "update/:product_id", to: "carts#update", as: :update
    delete "remove/:product_id", to: "carts#remove", as: :remove
    delete "clear",              to: "carts#clear",  as: :clear
  end

  resource :checkout, controller: :checkout, only: %i[new create]
  resources :orders, only: %i[index show]
  resources :contact_messages, only: %i[new create]

  namespace :admin do
    root "dashboard#index"
    resources :products
    resources :categories
    resources :orders, only: %i[index show update]
    resources :contact_messages, only: %i[index show update destroy]
    resources :reviews, only: %i[index update destroy]
  end
end
