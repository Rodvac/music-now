class RoomsController < ApplicationController

  def index
    if params[:search]
      @rooms = Room.all if params[:search][:address] == "" && params[:search][:capacity] == ""
      if params[:search][:address] != "" && params[:search][:capacity] != ""
        @rooms = Room.global_search(params[:search][:address]).global_search(params[:search][:capacity])
      elsif params[:search][:address] == ""
        @rooms = Room.global_search(params[:search][:capacity])
      else
        @rooms = Room.global_search(params[:search][:address])
      end
    else
      @rooms = Room.all
    end
  end

  private

  def room_params
    params.require(:room).permit(:capacity, :name)
  end
end
