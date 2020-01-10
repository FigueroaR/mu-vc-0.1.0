Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users do 
    resources :events, only: [:new]
      # :show, :edit, :destroy]
  end 
  resources :comments
  resources :rsvps
  get '/rsvp/create' => 'rsvps#create'
  
  resources :events, only: [:show, :edit, :index, :create, :new]
  delete '/event/:id', to: 'events#destroy'
  get '/event/:id', to: 'events#destroy', as: 'delete_event'

  #only: [:index, :create]

  root 'welcome#home'
  get '/auth/facebook/callback' => 'session#fbcreate'
  get '/signin', to: 'session#new', as: 'signin'
  post '/session', to: 'session#create', as: 'session'
  delete '/logout' => 'session#destroy'
  get '/logout' => 'session#destroy'

end
