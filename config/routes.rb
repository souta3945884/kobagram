Rails.application.routes.draw do
  post "likes/:topic_id/create" => "likes#create"
  post "likes/:topic_id/destroy" => "likes#destroy"
  
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  
  get "users/:id/likes" => "users#likes"
  
  get "topics/index" => "topics#index"
  get "topics/new" => "topics#new"
  get "topics/:id" => "topics#show"
  post "topics/create" => "topics#create"
  get "topics/:id/edit" => "topics#edit"
  post "topics/:id/update" => "topics#update"
  post "topics/:id/destroy" => "topics#destroy"
  
  
  get "/" => "home#top"
  get "about" => "home#about"
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
