require 'sidekiq/web'

Rails.application.routes.draw do
  match 'test', via: [:get], to:  proc { |env| [200, { 'Content-Type' => 'text/html' }, ['<h1>Hello From Routing!</h1>']] }
  # get 'shop/index'
  #
  # devise_for :admin_users, ActiveAdmin::Devise.config
  # ActiveAdmin.routes(self)
  # mount Sidekiq::Web => '/sidekiq'
  # get 'dashboard' => 'dashboard#index'
  # get '/auth/:provider/callback', to: 'sessions#create'

  mount SpalahApi::Engine => "/spalah_api"

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
  # mount_ember_app :frontend, to: '/'

  resources :users do
    collection do
      get :login
      post :auth
      delete :logout
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # scope :blog do
    resources :posts do # , constraints: {subdomain: 'blog'} do
      resources :comments, only: [:create, :destroy, :index]

      member do
        post :like
        post :unlike
      end
    end
  # end

  root 'posts#index'

  # mount Spalah::Api => '/'
  # mount GrapeSwaggerRails::Engine => '/documentation'
end
