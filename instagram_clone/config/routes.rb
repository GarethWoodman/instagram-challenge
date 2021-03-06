Rails.application.routes.draw do
  get      '/signup'     => 'users#new'
  post     '/signup'     => 'users#create'
  get      '/users/:id'  => 'users#show'

  get      '/login'      => 'sessions#new'
  post     '/login'      => 'sessions#create'
  delete   '/logout'     => 'sessions#destroy'

  post     '/pictures'   => 'pictures#create'
  delete   '/pictures'   => 'pictures#destroy'

  post     '/comments'   => 'comments#create'
  delete   '/comments'   => 'comments#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
