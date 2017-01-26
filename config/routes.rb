Rails.application.routes.draw do
	get '/photo'=>'products#index'
	get '/photo/new'=>'products#new'
	get '/photo/low_price'=>'products#low_to_high_Orders'
	get '/photo/high_price'=>'products#high_to_low_Orders'
	get '/photo/:id'=>'products#show'
	post '/photo'=>'products#create'
	get '/photo/:id/edit'=>'products#edit'
	patch '/photo/:id'=>'products#update'
	delete '/photo/:id'=>'products#destroy'

	get '/signup' => 'users#new'
    post '/users' => 'users#create'

    get '/login' => 'logins#new'
    post '/login' => 'logins#create'
    get '/logout' => 'logins#destroy'

    post'/orders'=>'orders#create'
    get'/orders/:id'=>'orders#show'

    get'/carted_products'=>'carted_products#index'
    post'/carted_products'=>'carted_products#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
#what your app is going to do