class RoomsController < ApplicationController
  def create
    # room作成
    @room = Room.create(user_id: params[:user_id])

    # user_room作成
    UserRoom.create(user_id: params[:user_id], room_id: @room.id)
    UserRoom.create(user_id: current_user.id, room_id: @room.id)
    redirect_to user_room_path(params[:user_id], @room.id)
  end

  def show
    @partner_user = User.find(params[:user_id])
    @room = Room.find(params[:id])
    @chats = Chat.where(room_id: params[:id])
    @new_chat =Chat.new
  end

end
