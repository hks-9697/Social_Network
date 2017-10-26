Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/accept_request' => 'friendships#accept_request'
  get '/chat' => 'chatboxes#chat'
  post '/like' => 'posts#like'
  post '/unlike' => 'posts#unlike'

  root 'sessions#new'

  resources :friendships
  resources :chatboxes

  resources :posts
  resources :interests
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
