Rails.application.routes.draw do
  resources :room_messages
  
	get '/',
		to: 'rooms#index',
		as: :rooms_index

	post '/create',
		to: 'rooms#create',
		as: :rooms_create

  get '/room/:name',
    to: 'rooms#show',
    as: :rooms_show

  delete '/room/:name/delete',
    to: 'rooms#delete',
    as: :rooms_delete

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
