Rails.application.routes.draw do
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  
  get "topics/index" => "topics#index"
  get "topics/new" => "topics#new"
  get "topics/:user_id" => "topics#show"
  post "topics/create" => "topics#create"
  get "topics/:user_id/edit" => "topics#edit"
  post "topics/:user_id/update" => "topics#update"
  post "topics/:user_id/destroy" => "topics#destroy"
  
  
  get "/" => "home#top"
  get "about" => "home#about"
  
  
  resources :topics do
    resources :comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
