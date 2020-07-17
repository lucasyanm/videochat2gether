class RoomsController < ApplicationController
  protect_from_forgery with: :null_session

	def index

	end

	def create
		room = Room.new(room_params)

    if room.save
      redirect_to rooms_show_url(room.name)
    else
      render 'index'
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

    render json: message
  end

  def update_video
    room = Room.find(params[:id])
    room.videoUrl = params[:videoUrl]
    room.save

    render json: room
  end

  def update_data
    room = Room.find(params[:id])

  end

	private

	def room_params
		params.permit(:name, :videoUrl)
	end
end
