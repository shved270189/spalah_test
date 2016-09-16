Rails.application.routes.draw do
  get 'dashboard' => 'dashboard#index'
  get '/auth/:provider/callback', to: 'sessions#create'

  devise_for :admins
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
      get :red
    end
    collection do
      get :two
    end
  end

  root 'posts#index'

end
