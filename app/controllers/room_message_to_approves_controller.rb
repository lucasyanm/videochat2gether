class RoomMessageToApprovesController < ApplicationController
  protect_from_forgery with: :null_session
  
  def refuse_message
    message = RoomMessageToApprove.find(params[:id])
    message.destroy
  end

end
