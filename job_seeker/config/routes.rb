Rails.application.routes.draw do
  authenticated :user, -> (user){user.admin?} do
    get 'admin', to: "admin#index"
    get 'admin/posts'
    get 'admin/comments'
    get 'admin/users'
    get 'admin/show_post'
    get 'admin/delete_post'
  end
  get 'search' , to:'search#index'
  root "posts#index"
  resources :posts do 
    resources :applications
  end

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
