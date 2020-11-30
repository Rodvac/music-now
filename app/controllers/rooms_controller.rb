class RoomsController < ApplicationController

  def index
    @rooms = Room.all
    if params[:search]
      if params[:search][:address].present?
        @studios = Studio.near(params[:search][:address], 10).map(&:id)
        @rooms = @rooms.where(studio_id: @studios)
      end
      if params[:search][:capacity].present?
        @rooms = @rooms.where("capacity <= #{params[:search][:capacity]}")
      end
      if params[:search][:item].present?
        @rooms = @rooms.where(name: params[:search][:item])
        raise
      end
    end
  end

  private

  def room_params
    params.require(:room).permit(:capacity, :name)
  end
end
