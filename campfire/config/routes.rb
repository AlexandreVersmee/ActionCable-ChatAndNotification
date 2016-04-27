Rails.application.routes.draw do
#  root to: 'rooms#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

resources :status do
    collection do
      post 'test_', :action => :test
    end
  end

  # Chat Routes
  get 'chat/index'

  # Notifications Routes
  resources :notifications, only: [:index, :destroy, :update]
  #post 'notifications/update'


  root                'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
