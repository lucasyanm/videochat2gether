class RoomMessageToApprovesController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @room = Room.find_by(name: params[:name])
  end
  
  def refuse_message
    message = RoomMessageToApprove.find(params[:id])
    message.destroy
  end

end
