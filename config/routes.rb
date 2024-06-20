Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"

  resources :groups do
    member do
      get :gallery
    end
  end

  resources :events do
    member do
      get :recap
      get :list
      get :share
      resources :photos, only: [:create, :destroy]
    end
  end


end
