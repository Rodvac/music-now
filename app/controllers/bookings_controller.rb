class BookingsController < ApplicationController

  def new
    @room = Room.find(params[:room_id])
    @booking = Booking.new
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
    params.require(:booking).permit(:starts_at,:duration)
  end
  
end
