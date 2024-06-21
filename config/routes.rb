Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"

  resources :groups do
    member do
      get :gallery
    end
  end

  resources :events do
    resources :event_categories, only: [:create]
    member do
      get :recap
      get :share
      resources :photos, only: [:create, :destroy]
      resources :ingredients, only: [:index, :new, :create, :destroy, :update]
    end
  end
end
