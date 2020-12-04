class MessagesController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @message = Message.new(message_params)
    @message.booking = @booking
    @message.user = current_user
    if @message.save
      BookingChannel.broadcast_to(
        @booking,
        {
          message: render_to_string(partial: "message", locals: { message: @message }),
          user_id: current_user.id
        }
      )
      if request.referer.include?("/bookings/")
        redirect_to booking_path(@booking, anchor: "message-#{@message.id}")
      else
        redirect_to user_path(current_user, anchor: "message-#{@message.id}")
      end

    else
      render "bookings/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
