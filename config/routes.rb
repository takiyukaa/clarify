Rails.application.routes.draw do
  get 'flags/create'
  devise_for :users
  root to: 'pages#home'
  get 'scan', to: 'products#scan'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :new, :show] do
    resources :review, only: [:new, :create]
    end
  resources :products, only: [:index, :show]
  resources :flags, only: [:create]
end
