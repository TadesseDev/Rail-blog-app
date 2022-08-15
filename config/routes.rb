Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'users/', to: 'users#index'
  get 'users/:user_id/posts/:id', to: 'users#post'
  get 'users/:user_id/posts', to: 'users#posts'
  get 'users/:id', to: 'users#user'
  # Defines the root path route ("/")
  # root "articles#index"
end
