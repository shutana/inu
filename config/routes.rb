Rails.application.routes.draw do
  get 'users/show'

  root "home#top"
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  

  get "/" , to: "home#top"
  resources :posts
  resources :users, only: [:show]
end
