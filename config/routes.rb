Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :groups do
    member do
      get :gallery
    end
  end

  resources :events do
    member do
      get :recap
      get :list
      resources :photos, only: [:create, :destroy]
    end
  ends
end
