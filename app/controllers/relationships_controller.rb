class RelationshipsController < ApplicationController
  def create
    # ボタン連打しても1回しかフォローできないようにする
    if not current_user.following?(User.find(params[:user_id]))
      # フォローする
      @relationship = Relationship.new
      @relationship.follower_id = current_user.id
      @relationship.followed_id = params[:user_id]
      @relationship.save
    end
    # 元の画面に遷移する
    redirect_to request.referer
  end

  def destroy
    # ボタン連打しても1回しかフォロー解除できないようにする
    if current_user.following?(User.find(params[:user_id]))
      # 削除する
      @relationship = Relationship.find_by(follower_id: current_user.id, followed_id: params[:user_id])
      @relationship.delete
    end
    # 元の画面に遷移する
    redirect_to request.referer
  end

  def following
    @follows = User.find(params[:user_id]).followings
    p @follows
  end

  def follower
    @followers = User.find(params[:user_id]).followedsr
  end
end
