Rails.application.routes.draw do
  get 'flags/create'
  post 'flags/multi_create', to: 'flags#multi_create', as: :flags_multi_create
  devise_for :users
  root to: 'pages#home'
  get 'scan', to: 'products#scan'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :new, :show, :update] do
    get 'friends'
    post 'friend_request'
    resources :review, only: [:new, :create]
    member do
      get 'shelf'
    end
  end
  resources :products, only: [:index, :show] do
    member do
    post "like", to: 'products#like'
    post "unlike", to: 'products#unlike'
    end
  end
  resources :flags, only: [:create]
end


