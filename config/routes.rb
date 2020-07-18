Rails.application.routes.draw do  
	get '/',
		to: 'rooms#index',
		as: :rooms_index

	post '/create',
		to: 'rooms#create',
		as: :rooms_create

  get '/room/:name',
    to: 'rooms#show',
    as: :rooms_show

  get '/room/:name/checkupdate',
    to: 'rooms#check_update',
    as: :rooms_check_update

  delete '/room/:name/delete',
    to: 'rooms#delete',
    as: :rooms_delete

  post '/rooom/:name/sendmessage',
    to: 'rooms#send_message',
    as: :rooms_send_message

  delete '/room/:name/refusemessage',
    to: 'room_message_to_approves#refuse_message',
    as: :rooms_message_to_approves_refuse_message

  post '/room/:name/approvemessage',
    to: 'rooms#approve_message',
    as: :rooms_approve_message

  put '/room/:name/upvideo',
    to: 'rooms#update_video',
    as: :rooms_update_video

  get '/room/:name/updata',
    to: 'rooms#update_data',
    as: :rooms_update_data

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
