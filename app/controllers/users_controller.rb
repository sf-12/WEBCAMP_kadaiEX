# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: params[:id])

    p "==============================================================================================="
    p @user


    # チャット機能
    # user_roomテーブルからレコードを特定する
    userRoomsCurrentUser = UserRoom.where(user_id: current_user.id)
    userRoomsPartnerUser = UserRoom.where(user_id: @user.id)
    userRoom = find_user_room(userRoomsCurrentUser, userRoomsPartnerUser)
    if userRoom.present?
      # 特定したuser_roomのレコードからroom_idを取得
      @roomId = userRoom.room_id
      @RoomExist = true
    else
      # そもそもuser_roomにレコードがなければ、レコードを作成
      @userRoom = UserRoom.new
      @room = Room.new
      @RoomExist = false
    end
  end

  def edit
    @user = User.find(params[:id])

    p "==============================================================================================="
    p @user


    redirect_to user_path(current_user) if current_user != @user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'You have updated user successfully.'
      redirect_to user_path(params[:id])
    else
      render :edit
    end
  end

  private

  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image_id)
  end

  # user_roomテーブルのレコードを特定する
  def find_user_room(userRooms1, userRooms2)
    userRooms1.each do |ur1|
      userRooms2.each do |ur2|
        return userRoom = UserRoom.find(ur1.id) if ur1.room_id == ur2.room_id
      end
    end
    # レコードがなかった時
    nil
  end
end
