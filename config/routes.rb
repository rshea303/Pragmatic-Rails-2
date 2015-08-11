Rails.application.routes.draw do
  resource :session

  root "movies#index"

  get "movies/filter/:scope" => "movies#index", as: :filtered_movies

  resources :movies do
    resources :reviews
    resources :favorites
  end

  resources :users

  get "signup" => "users#new"
  get "signin" => "sessions#new"
end
