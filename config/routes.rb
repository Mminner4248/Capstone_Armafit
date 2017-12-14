Rails.application.routes.draw do

  get 'home/index'
  root 'home#index'
  
  resources :user_schedules
  resources :users
  resources :sessions
  resources :schedules
  resources :gyms
  resources :images

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  delete 'photo/:id' => 'photos#destroy', as: 'photo'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
