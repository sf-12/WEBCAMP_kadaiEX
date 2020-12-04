class ChatsController < ApplicationController

  def create
    # chat作成
    p "--------------------====================="
    chat = Chat.new(chat_params)
    chat.user_id = current_user.id
    chat.room_id = params[:room_id]
    chat.save
    # 元の画面に戻る
    redirect_to user_room_path(params[:user_id], params[:room_id])
  end

  private

  def chat_params
    params.require(:chat).permit(:message)
  end

end
