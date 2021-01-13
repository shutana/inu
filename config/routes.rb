Rails.application.routes.draw do
  root "home#top"
  get "users/show", to: "users#show"
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  

  get "/" , to: "home#top"
  resources :users, only: [:show] 
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
end
