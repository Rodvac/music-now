class UsersController < ApplicationController
  # skip_after_action :verify_authorized

  def show
    @user = User.find(params[:id])
    @bookings = Booking.where(user_id: @user.id)
    @studios = Studio.where(user_id: @user.id)
    @chatroom = Chatroom.where(user_id: @user_id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :status)
  end
end
