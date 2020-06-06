Rails.application.routes.draw do
  get 'signup' => 'users#new'
  post '/users' => 'users#create'

  get 'login' => 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
