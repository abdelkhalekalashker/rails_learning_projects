Rails.application.routes.draw do
  get 'search' , to:'search#index'
  root "posts#index"

  resources :posts do 
    resources :applications
  end

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
