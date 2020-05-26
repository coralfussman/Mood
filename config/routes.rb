Rails.application.routes.draw do
  resources :categories
  resources :image_categories
  resources :images
  resources :board_images
  resources :boards
  resources :users
  get '/', to: 'home_pages#home', as: "home_page"
  get '/gallery', to: 'sessions#new', as: 'login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
