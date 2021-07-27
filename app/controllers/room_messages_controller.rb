class RoomMessagesController < ApplicationController
  protect_from_forgery with: :null_session

  def index

  end

  def send_message
    room = Room.find(params[:id])

    message = RoomMessage.new
    message.room = room
    message.user = params[:user]
    message.message = params[:message]
    
    message.created_at = DateTime.now
    message.updated_at = DateTime.now

    message.save

    render json: message
  end

  def approve_message
    message = RoomMessage.find(params[:id])
    message.approved = true
    message.pending_to_approve = false

    message.updated_at = DateTime.now

    message.save

    render json: message
  end

  def refuse_message
    message = RoomMessage.find(params[:id])
    message.pending_to_approve = false
    
    message.updated_at = DateTime.now

    message.save
  end
end
