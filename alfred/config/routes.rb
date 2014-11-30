Rails.application.routes.draw do
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

end
