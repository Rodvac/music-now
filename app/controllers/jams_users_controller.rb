class JamsUsersController < ApplicationController

    def create
        @jams_user = JamsUser.new(jams_user_params)
        @jam = Jam.find(params[:jam_id])
        @jams_user.jam = @jam 
        @user = current_user
        @jams_user.user = current_user
        @jams_user.paid = false 
        @jams_user.admin = false
        @jams_user.save!
        redirect_to jam_path(@jam)
    end 

    def update
        @jams_user = JamsUser.find(params[:id])
        @jams_user.update!(update_params)
        redirect_to jam_path(@jams_user.jam)
    end 

    def destroy 
        @jams_user = JamsUser.find(params[:id])
        @jam = @jams_user.jam
        @jams_user.destroy!
        redirect_to jam_path(@jam)
    end 

    private

    def jams_user_params
        params.require(:jams_user).permit(:instrument)
    end 

    
    def update_params
        params.require(:jams_user).permit(:instrument, :paid)
    end 

end
