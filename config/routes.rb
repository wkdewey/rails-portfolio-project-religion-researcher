Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#welcome'
  resources :researchers, only: [:new, :create, :show]
  resources :projects do
    resources :texts, only: [:index, :new, :create]
    resources :notes, only: [:index, :new, :create, :edit, :update]
    get 'search', on: :collection
  end
  resources :texts
  resources :notes, only: [:index, :new, :create, :edit, :update] do
    get 'written', on: :collection
  end
  get '/signup', to: 'researchers#new'
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  match '/auth/:provider/callback', to: 'sessions#create_omniauth', via: [:get, :post]
end