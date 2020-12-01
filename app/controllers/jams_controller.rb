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
        @jam.groupe = false 
        @jams_user = JamsUser.new(instrument: params[:other][:instrument], admin: true)
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

    def update
        @jam= Jam.find(params[:id])
        if @jam.update!(update_params)
          redirect_to jam_path(@jam)
        else
          raise
        end
      end

    private 

    def jam_params
        params.require(:jam).permit(:name,:description)
    end 

    def update_params
        params.require(:jam).permit(:name,:description,:groupe)
    end 

end
