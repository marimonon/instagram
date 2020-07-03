Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  get 'fabs/create'
  get 'fabs/destroy'
  devise_for :users, 
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks', 
  registrations: 'users/registrations',
  sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  devise_scope :user do
    get "signup", :to => "users/registrations#new"    
    get "logout", :to => "users/sessions#destroy"
    root :to => "users/sessions#new"  
  end

  # root to: "posts#index"
  # get "login", :to => "users/sessions#new"
  
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users', to: 'users#index'
#　↑resourcesと被らないか。
  
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member # 追加
    get :followers, on: :member # 追加
  end
  
  resources :posts, only: %i(new create show destroy) do
    resources :comments, only: %i(create destroy)
    resources :fabs, only: %i(create destroy)
  end
end