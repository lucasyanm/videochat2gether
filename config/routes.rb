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

  get '/room/:name/mod',
    to: 'rooms#mod',
    as: :rooms_mod

  get '/room/:name/checkupdate',
    to: 'rooms#check_update',
    as: :rooms_check_update

  delete '/room/:name/delete',
    to: 'rooms#delete',
    as: :rooms_delete

  put '/room/:name/upvideo',
    to: 'rooms#update_video',
    as: :rooms_update_video
    
  post '/room/sendmessage',
    to: 'room_messages#send_message',
    as: :room_messages_send_message

  delete '/room/:name/refusemessage',
    to: 'room_messages#refuse_message',
    as: :room_messages_refuse_message

  post '/room/:name/approvemessage',
    to: 'room_messages#approve_message',
    as: :room_messages_approve_message

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
