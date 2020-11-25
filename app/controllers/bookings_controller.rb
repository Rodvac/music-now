require 'date'

class BookingsController < ApplicationController

  def new
    @room = Room.find(params[:room_id])
    @booking = Booking.new
    @date = Date.today
    @datearray = []
    14.times do 
      @datearray << @date
      @date = @date + 1 
    end 
    @timearray = [ "8:00", "9:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00" ]
  end
  
  def create
    @booking = Booking.new(booking_params)
    @room = Room.find(params[:room_id])
    @booking.room = @room
    @user = current_user
    @booking.user = @user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end 
  end 

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:date,:time)
  end
  
end
