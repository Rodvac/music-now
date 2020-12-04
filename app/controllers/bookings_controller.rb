require 'date'

class BookingsController < ApplicationController
  def new
    @room = Room.find(params[:room_id])
    @booking = Booking.new
    @date = params[:format].to_date
    @datearray = []

    month = @date.month
    year = @date.year
    @start = Date.new(year, month, 1)
    30.times do
      @datearray << @start
      @start = @start + 1
    end
    @start = Date.new(year, month, 1)

    @timearray = [ "8:00", "9:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00" ]
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    @room = Room.find(params[:room_id])
    @booking.room = @room
    @user = current_user
    @booking.user = @user
    @booking.starts_at = DateTime.parse("#{@booking.date} #{@booking.time}")
    if @booking.save
      if params[:other]
        @jam = Jam.find(params[:other][:jam_id])
        @jam.booking = @booking
        @jam.save
        redirect_to jam_path(@jam) and return
      end
      redirect_to booking_path(@booking) and return
    else
      redirect_to new_room_booking_path(@room, Date.today)
    end

  end

  def show
    @booking = Booking.find(params[:id])
    @review = Review.new
    @id = @booking.room.studio.id
    @studios = Studio.where(id: @id)
    @studio = Studio.find(@id)
    @markers = [
      {
        lat: @studio.latitude,
        lng: @studio.longitude,
      }]
    @message = Message.new
  end

  def destroy
    @jam = Jam.find(params[:id])
    @jam.destroy
    redirect_to jams_path
  end 

  private

  def booking_params
    params.require(:booking).permit(:date, :time)
  end
end
