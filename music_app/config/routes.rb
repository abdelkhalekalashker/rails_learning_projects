Rails.application.routes.draw do
  root to: redirect('/bands')

  # get 'notes/create'
  # get 'notes/destroy'
  # get 'tracks/index'
  # get 'tracks/create'
  # get 'tracks/new'
  # get 'tracks/edit'
  # get 'tracks/update'
  # get 'tracks/destroy'
resources :users , only: [:show, :new, :create]
resource :session , only: [:new, :create, :destroy]

resources :bands do 
  resources :albums, only: [:new]
end

resources :albums , only: [:edit , :update , :destroy , :create , :index , :show] do 
  resources :tracks , only: [:new]
end

resources :tracks , only: [:edit , :update , :destroy , :create , :index , :show]

resources :notes , only:[:create , :destroy]
end
