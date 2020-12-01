class JamsUsersController < ApplicationController

    def create
        @jams_user = JamsUser.new(jams_user_params)
        @jam = Jam.find(params[:jam_id])
        @jams_user.jam = @jam 
        @user = current_user
        @jams_user.user = current_user
        @jams_user.save!
        redirect_to jam_path(@jam)
    end 

    private

    def jams_user_params
        params.require(:jams_user).permit(:instrument)
    end 

end
