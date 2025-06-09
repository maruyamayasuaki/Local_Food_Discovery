class RoomsController < ApplicationController
    before_action :authenticate_user!
    def create
      @room = Room.create
      Entry.create(room_id: @room.id, user_id: current_user.id)
      Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
      redirect_to room_path(@room)
    end
  
    def index
      my_room_id = current_user.entries.pluck(:room_id)
      @another_entries = Entry
                        .where(room_id: my_room_id)
                        .where.not(user_id: current_user.id)
                        .preload(room: :messages)
                        .preload(user: { icon_attachment: :blob })
    end
  
    def show
      @room = Room.find(params[:id])
      if Entry.where(user_id: current_user.id, room_id: @room.id).present?
        @messages = @room.messages.all
        @message = Message.new
        @entries = @room.entries
      else
        redirect_back(fallback_location: root_path)
      end
    end
  
end
