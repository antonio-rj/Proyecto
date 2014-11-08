Rails.application.routes.draw do
  resources :offices

  resources :equipment

  resources :users

  get 'static_pages/home'
end
