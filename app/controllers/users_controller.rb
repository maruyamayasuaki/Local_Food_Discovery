class UsersController < ApplicationController
    before_action :authenticate_user!

    # users_controller.rb
    def index
      @users = User.all
    end

    def show
        @user = User.find(params[:id])
        @prefecture = Prefecture.find(@user.prefecture_id) if @user.prefecture_id.present?
        @city = City.find(@user.city_id) if @user.city_id.present?
        @currentUserEntry=Entry.where(user_id: current_user.id)
        @userEntry=Entry.where(user_id: @user.id)
        if @user.id == current_user.id
          @msg ="他のユーザーとDMしてみよう！"
        else
          @currentUserEntry.each do |cu|
            @userEntry.each do |u|
              if cu.room_id == u.room_id then
                @isRoom = true
                @roomId = cu.room_id
              end
            end
          end
    
          if @isRoom != true
            @room = Room.new
            @entry = Entry.new
          end
    
        end


      end
end
