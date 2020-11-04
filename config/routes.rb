Rails.application.routes.draw do
  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :events, only: [:new, :create, :show, :index] do
    member do
      get 'rsvp'
    end
  end
  
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
