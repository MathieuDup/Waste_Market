Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products do
    resources :bookmarks, only: :create
    resources :orders, only: :create
  end

  resources :orders, only: %i[index show edit update] do
    resources :messages, only: %i[index create]
    resources :reviews, only: %i[new create]
  end

  resources :bookmarks, only: :destroy
  resources :users, only: %i[show edit update]

  get '/orders/:id/order_done', to: "orders#update_done"
end
