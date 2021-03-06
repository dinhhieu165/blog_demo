Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  root 'static_pages#home'

  get  '/post',    to: 'static_pages#post'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/index', to: 'static_pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :microposts,          only: [:create, :destroy]
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
  resources :account_activations
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
