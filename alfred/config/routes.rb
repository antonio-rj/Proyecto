Rails.application.routes.draw do
  resources :controls

  resources :offices

  resources :equipment

  resources :users

  get 'static_pages/home'
end
