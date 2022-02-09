Rails.application.routes.draw do
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  # resources :users, only: [:index, :show, :edit, :update]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'login', to: 'sessions#destroy'
end
