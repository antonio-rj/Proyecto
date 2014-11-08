Rails.application.routes.draw do
  resources :equipment

  resources :users

  get 'static_pages/home'
end
