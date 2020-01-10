Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users do 
    resources :events, only: [:new, :show, :edit, :destroy]
  end 

  #resources :users do 
    #resources :rsvps, only: [:index]
  #end 
  
  resources :events, only: [:index]

  root 'welcome#home'
  get '/auth/facebook/callback' => 'session#fbcreate'
  get '/signin', to: 'session#new', as: 'signin'
  post '/session', to: 'session#create', as: 'session'
  delete '/logout' => 'session#destroy'
  get '/logout' => 'session#destroy'

end
