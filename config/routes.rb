Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :public do
  root 'homes#top'
  get '/about' => 'homes#about'
  
  get 'customers/confirm' => 'customers#confirm'
  resources :customers, only: [:show, :edit, :update, :confirm, :withdraw]
  resources :addresses, only: [:index, :edit, :update, :create, :destroy]
  
  
  resources :cart_items, only: [:create, :index, :destroy, :update]
  
  
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/complete' => 'orders#complete'
  
  resources :orders, only: [:index, :show, :new, :create]
end



namespace :admin do
  root 'homes#top'
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :orders, only: [:show, :update]
  resources :order_details, only: [:update]
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
