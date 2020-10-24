Rails.application.routes.draw do
  get "topics/new" => "topics#new"
  get "topics/index" => "topics#index"
  get "topics/:user_id" => "topics#show"
  post "topics/create" => "topics#create"
  
  get "/" => "home#top"
  get "about" => "home#about"
  
  
  resources :users
  resources :topics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
