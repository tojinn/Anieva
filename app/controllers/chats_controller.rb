class ChatsController < ApplicationController
  
  def show
    @customer = Customer.find(params[:id])
    rooms = current_customer.user_rooms.pluck(:room_id)
    user_rooms = UserRoom.find_by(customer_id: @customer.id, room_id: rooms)
    #部屋が作られていなかったら新しく部屋を作る記述
    if user_rooms.nil?
     @room = Room.new
     @room.save
     UserRoom.create(customer_id: @customer.id, room_id: @room.id)
     UserRoom.create(customer_id: current_customer.id, room_id: @room.id)
    else
     @room = user_rooms.room
    end
    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
  end

  def create
    @chat = current_customer.chats.new(params.require(:chat).permit(:message, :room_id))
    @chat.save
  end
  
  private

end
