Rails.application.routes.draw do

  root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'
#  resources :users
  resources :users do
    member do
      get :following, :followers
    end
  end

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  #resources :users
  #resources :account_activations, only: [:edit] # chapter 10 skipped
  #resources :password_resets,     only: [:new, :create, :edit, :update] # chapter 10 skipped
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]


#  get 'sessions/new'
#  get 'users/new'
#  root 'static_pages#home'
#  get  'static_pages/help'
#  get  'static_pages/about'
#  get  'static_pages/contact'


end
