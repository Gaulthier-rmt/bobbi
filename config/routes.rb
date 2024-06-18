Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :groupes do
    member do
      get :galerie
    end
  end

  resources :evenements do
    member do
      get :recap
      get :liste
      resources :photos, only: [:create, :destroy]
    end
  end
end
