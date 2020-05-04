Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'users#new', as: 'user'
  post '/', to: 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create' 
  post '/logout' => 'sessions#destroy'
  get '/:user', to: 'users#show', as: 'homepage'
end
