Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  resources :comments
  resources :rsvps
  resources :users do 
    resources :events, only: [:new, :edit, :index ]
  end 
  get '/events/myevents', to: "events#myindex", as: 'myindex'
  resources :events, only: [:show, :index, :create, :update ]

  delete '/event/:id', to: 'events#destroy'
  get '/event/:id', to: 'events#destroy', as: 'delete_event'

  get '/auth/facebook/callback' => 'session#fbcreate'
  get '/signin', to: 'session#new', as: 'signin'
  post '/session', to: 'session#create', as: 'session'
  delete '/logout' => 'session#destroy'
  get '/logout' => 'session#destroy'

end
