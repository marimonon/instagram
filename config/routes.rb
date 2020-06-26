Rails.application.routes.draw do
  devise_for :users, 
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  devise_scope :user do
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end
  
  root to: "posts#index"
  get '/users/:id', to: 'users#show', as: 'user'

  resources :posts, only: %i(new create show destroy) do
    resources :comments, only: %i(create destroy)
  end
end