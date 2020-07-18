class RoomsController < ApplicationController
  protect_from_forgery with: :null_session

	def index

	end

	def create
		room = Room.new(room_params)

    if room.save
      redirect_to rooms_show_url(room.name)
    else
      render json: {}, status: :bad_request
    end

	end

  def show
    @room = Room.find_by(name: params[:name])
  end

	def delete
		room = Room.find(params[:id])
    room.destroy
    
    redirect_to rooms_index_url if room.destroy
	end

  def send_message
    room = Room.find(params[:id])

    messageToApprove = RoomMessageToApprove.new
    messageToApprove.room = room
    messageToApprove.user = params[:user]
    messageToApprove.message = params[:message]

    messageToApprove.save

    render json: messageToApprove
  end

  def approve_message
    approvedMessage = RoomMessageToApprove.find(params[:id])

    message = RoomMessage.new()
    message.room = approvedMessage.room
    message.user = approvedMessage.user
    message.message = approvedMessage.message

    message.save
    approvedMessage.destroy

    render json: message
  end

  def check_update
    room = Room.find(params[:id])

    render json: {}, status: :not_found if room.nil?

    render json: {
      'messages': room.room_messages.order(created_at: :desc),
      'messagesToApprove': room.room_message_to_approve.order(created_at: :desc),
      'videoUrl': room.videoUrl
    }
  end

  def update_video
    room = Room.find(params[:id])
    room.videoUrl = params[:videoUrl]
    room.save

    render json: room
  end

	private

	def room_params
		params.permit(:name, :videoUrl)
	end
end
