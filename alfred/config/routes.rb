Rails.application.routes.draw do
  resources :controls

  resources :offices

  resources :equipment

  resources :users

  
  root                  'static_pages#home'
  get   'contact'    => 'static_pages#contact'

end
