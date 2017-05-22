Rails.application.routes.draw do

  get 'admin_panel' => 'users#admin_panel'

  devise_for :users
  
  resources :galleries, param: :name
  resources :pictures, only: [:destroy]

  root 'galleries#home'

  get '*path' => redirect('/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
