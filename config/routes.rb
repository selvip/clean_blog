Rails.application.routes.draw do
	root 'users#index'
  
	resources :users

	resources :blog_posts

  get '/index', to: 'static_pages#index'

  # get '/post', to: 'static_pages#post'

  get '/about', to: 'static_pages#about'

  get '/contact', to: 'static_pages#contact'

  # get '/userlist', to: 'users#index'

  # root 'static_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
