Rails.application.routes.draw do
  get 'login/new'

	resources :controls do
		collection do
    		get 'returns'
  			get 'get_control'
  		end
  	end

	resources :offices

	resources :equipment

	resources :users


	root  'static_pages#home'
	get   'contact'    => 'static_pages#contact'
	get   '/signup'    => 'login#new'

end
