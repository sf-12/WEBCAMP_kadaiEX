class ChatsController < ApplicationController

  def create

    # JavaScriptに渡すインスタンス変数
    @chats = Chat.where(room_id: params[:room_id])
    @partner_user = User.find(params[:user_id])
    @new_chat = Chat.new
    @room = Room.find(params[:room_id])

    # chat作成
    chat = Chat.new(chat_params)
    chat.user_id = current_user.id
    chat.room_id = params[:room_id]
    chat.save
  end

  private

  def chat_params
    params.require(:chat).permit(:message)
  end

end
