class JamsController < ApplicationController

    def index
        @jams = Jam.all
    end 

    def new
        @jam = Jam.new
        @jams_user = JamsUser.new
    end
    
    def create
        @jam = Jam.new(jam_params)
        @jams_user = JamsUser.new(instrument: params[:other][:instrument])
        @jams_user.user = current_user
        if @jam.save!
            @jams_user.jam = @jam
            @jams_user.save
            redirect_to jam_path(@jam)
        else
          raise
        end 
    end

    def show
        @jam = Jam.find(params[:id])
        @jams_users = JamsUser.where(jam_id: @jam.id)
        @jams_user = JamsUser.new
    end 

    private 

    def jam_params
        params.require(:jam).permit(:name,:description,jams_users_attributes: [:instrument])
    end 

end
