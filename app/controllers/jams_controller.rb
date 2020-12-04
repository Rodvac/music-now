class JamsController < ApplicationController

    def index
        @jams = Jam.all
        @userarray = {}
        @jams.each do |jam|
            jam.jams_users.each do |j|
                @userarray["#{j.jam.id} et #{j.user.id}".to_sym] = 1
            end 
        end 
        @myjams = []
        @jams.each do |jam|
            if @userarray["#{jam.id} et #{current_user.id}".to_sym] == 1 && jam.booking == nil
                @myjams << jam
            end 
        end 
    end 

    def new
        @jam = Jam.new
        @jams_user = JamsUser.new

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
    end
    
    def create
        @jam = Jam.new(jam_params)
        @jam.groupe = false 
        @jams_user = JamsUser.new(instrument: params[:other][:instrument], admin: true, paid: false)
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
        @rooms = Room.all.sample(4)
        @allpaid = 0
        @jams_users.each do |jams_user|
            if jams_user.paid == true 
                @allpaid += 1
            end 
        end 
        @booking = Booking.new 

        @date = @jam.date.to_date
        @datearray = []
        month = @date.month
        year = @date.year
        @start = Date.new(year, month, 1)
        30.times do 
          @datearray << @start
          @start = @start + 1
        end 
        @start = Date.new(year, month, 1)
        @jampresent = 0
        @jams_users.each do |j|
            if j.user == current_user
                @jampresent = 1
            end
        end 
        @users = []
        @jams_users.each do |j|
            @users << j.user
        end 
    end 

    def update
        @jam = Jam.find(params[:id])
        @jams_users = JamsUser.where(jam_id: @jam.id)
        
        
        if @jam.groupe == true 
            if @jam.update!(room_update_params)
                @jams_users.each do |jams_user|
                    jams_user.priceuser = (@jam.room.price / @jams_users.count).to_f
                end 
                redirect_to jam_path(@jam)
            else
                raise
            end
        end

        if @jam.groupe == false 
            if @jam.update!(update_params)
            redirect_to jam_path(@jam)
            else
            raise
            end
        end 

    end 

    def destroy
        @jam = Jam.find(params[:id])
        @jam.destroy
        redirect_to jams_path
      end 

    private 

    def jam_params
        params.require(:jam).permit(:name,:description,:date,:time,:photo)
    end 

    def update_params
        params.require(:jam).permit(:name,:description,:groupe)
    end 

    def room_update_params
        params.require(:jam).permit(:name,:description,:groupe, :room_id)
    end 

end
