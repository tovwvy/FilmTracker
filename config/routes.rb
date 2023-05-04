Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'home', to:'pages#home'
  get 'films', to: 'films#index'
  get 'new',to: 'films#new'
  root 'pages#home'
  
   
  resources :films, only: [:update]
  resources :films do
    resources :comments, only: [:create, :edit, :update]
  end


end
