class RoomsController < ApplicationController
  protect_from_forgery with: :null_session

	def index
		@room = Room.new
	end

	def create
		@room = Room.new(room_params)

    if @room.save
      redirect_to rooms_show_url(@room.name)
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

	private

	def room_params
		params.permit(:name)
	end
end
