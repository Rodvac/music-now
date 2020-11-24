class BookingsController < ApplicationController
  skip_after_action :verify_authorized

  def index
    @bookings = Booking.all
  end

  def new
    @already_booked = []
    @studio = Studio.find(params[:studio_id])
    @studio.bookings.all.each do |booked|
      @already_booked << booked.date
    end
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
    @studio = Studio.find(@booking.studio_id)
    # @conversation = Conversation.find_by(booking_id: @booking.id)
    # @messages = Message.where(conversation_id: @conversation.id)
    # @message = Message.new(conversation_id: @conversation.id)
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def create
    # @studio = Studio.find(params[:booking][:studio_id])
    # if params[:booking][:date] == ""
    #   @booking = Booking.new
    #   redirect_to new_studio_booking_path(@studio)
    #   return
    # else
    #   params[:booking][:date].split(",").each do |date|
    #   date.to_date
    #   @bookings = []
    #   @booking = Booking.new(date: date)
    #   @conversation = Conversation.new
    #   @booking.studio = @studio
    #   @booking.user = current_user
    #   @conversation.booking = @booking
    #   @conversation.save
    #   @booking.save
    #   @bookings << @booking
    #   end
    # end
    # if @booking.nil?
    #   @booking = Booking.new
    #   render :new
    # elsif @bookings.each(&:save)
    #   redirect_to user_path(@booking.user)
    # else
    #   @booking = Booking.new
    #   render :new
    # end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_path(current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :status)
  end
end
