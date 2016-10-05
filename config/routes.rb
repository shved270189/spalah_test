require 'sidekiq/web'

Rails.application.routes.draw do
  get 'shop/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount Sidekiq::Web => '/sidekiq'
  get 'dashboard' => 'dashboard#index'
  get '/auth/:provider/callback', to: 'sessions#create'

  namespace :api, defaults: { format: :json } do
    resources :posts, only: [:index, :show, :create, :update, :destroy] do
      member do
        post :like
        post :unlike
      end
    end

    resources :users, only: [] do
      collection do
        post :sign_in
        delete :sign_out
      end
    end
  end

  resources :users do
    collection do
      get :login
      post :auth
      delete :logout
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
    resources :comments, only: [:create, :destroy, :index]

    member do
      post :like
      post :unlike
    end
  end

  root 'posts#index'

  mount Spalah::Api => '/'

end
