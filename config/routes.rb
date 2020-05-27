Rails.application.routes.draw do
  resources :categories
  resources :image_categories
  resources :images, only: [:index, :show]
  resources :board_images, only: [:new, :create, :destroy]
  resources :boards
  resources :users
  get '/', to: 'home_pages#home', as: "home_page"
  get '/login', to: 'sessions#new_login', as: "new_login"
  post '/login', to: 'sessions#login', as: "login"
  delete '/logout', to: 'sessions#logout', as: 'logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
