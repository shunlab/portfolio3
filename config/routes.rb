Rails.application.routes.draw do
  root 'static_pages#home'
  get :favorites, to: 'favorites#index'
  get :about,        to: 'static_pages#about'
  get :use_of_terms, to: 'static_pages#terms'
  get :signup,       to: 'users#new'
  get    :login,     to: 'sessions#new'
  post   :login,     to: 'sessions#create'
  delete :logout,    to: 'sessions#destroy'
  post   "favorites/:dish_id/create"  => "favorites#create"
  delete "favorites/:dish_id/destroy" => "favorites#destroy"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :dishes
end
