Rails.application.routes.draw do

  root to: 'pages#home'
  devise_for :users

  resources :flags, only: [:create, :destroy]

  resources :flags do
    collection do
      post 'multi_create', to: 'flags#multi_create'
    end
  end

  resources :users, only: [:create, :new, :show, :update] do
    resources :review, only: [:new, :create]

    member do
      get :shelf
    end

    get 'friends'
    post 'friend_request'
  end

  resources :products, only: [:index, :show] do

    collection do
      get :scan
      get :compare
    end

    member do
      post "like", to: 'products#like'
      post "unlike", to: 'products#unlike'
    end
  end

end
