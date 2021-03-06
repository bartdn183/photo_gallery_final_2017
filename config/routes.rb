Rails.application.routes.draw do

  resources :gallery_comments, only: [:edit, :create, :update, :destroy]
  resources :post_comments, only: [:edit, :create, :update, :destroy]
  resources :activities, only: [:index]
  resources :posts
  resources :comments
  get 'admin_panel' => 'users#admin_panel'

  devise_for :users, :controllers => { :registrations => "my_registrations" }
    get 'friends' => 'users#index'
  resources :galleries, param: :name
  resources :pictures, only: [:show, :destroy]
  resources :users, only: [:show], param: :username, :path => ''
  root 'galleries#home'
  post 'update_role' => 'users#update_role'
  post 'delete_account' => 'users#delete_account'

  get '*path' => redirect('/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
