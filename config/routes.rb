Rails.application.routes.draw do

  root to: 'pages#home'
  devise_for :users

  resources :flags, only: [:create, :destroy]

  resources :flags do
    collection do
      post 'multi_create', to: 'flags#multi_create', as: :flags_multi_create
    end
  end

  resources :users, only: [:create, :new, :show, :update] do
    get 'friends'
    post 'friend_request'

    resources :review, only: [:new, :create]

    member do
      get 'shelf'
    end
  end

  resources :products, only: [:index, :show] do

    collection do
      get 'scan', to: 'products#scan'
      get 'compare', to: 'products#compare', as: :products_compare
    end

    member do
      post "like", to: 'products#like'
      post "unlike", to: 'products#unlike'
    end
  end

end
