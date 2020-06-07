Rails.application.routes.draw do
  get 'pictures/new'

  get      '/signup'     => 'users#new'
  post     '/signup'     => 'users#create'
  get      '/users/:id'  => 'users#show'

  get      '/login'      => 'sessions#new'
  post     '/login'      => 'sessions#create'
  delete   '/logout'     => 'sessions#destroy'

  post     '/pictures'   => 'pictures#create'
  delete   '/pictures'   => 'pictures#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
