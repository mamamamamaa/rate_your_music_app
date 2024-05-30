Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "home#index"
  resources :labels
  resources :genres
  resources :artists
  resources :albums do
    resources :reviews, only: [:new, :create]
  end
  get "tracks_for_you", to: "albums#tracks_for_you"
  resources :tracks do
    collection do
      get :tracks_for_you
    end
  end
  resources :reviews do
    collection do
      get :my_reviews
    end
  end
  resources :tracks
  resources :profiles do
    member do
      post :add_favorite_genre
    end
  end
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    confirmations: "users/confirmations",
    passwords: "users/passwords",
    unlocks: "users/unlocks"
  }
  get "about", to: "pages#about"
  get "privacy_policy", to: "pages#privacy_policy"
  get "terms_of_service", to: "pages#terms_of_service"
end
