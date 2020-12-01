class FavoritesController < ApplicationController
  def create
    # ボタン連打しても1回しか"いいね"できないように"いいね"してない時のみ処理
    if not Book.find(params[:book_id]).favorited_by?(current_user)
      # 登録する
      @favorite = Favorite.new
      @favorite.user_id = current_user.id
      @favorite.book_id = params[:book_id]
      @favorite.save
    end
    # 画面遷移する
    redirect_to books_path
  end

  def destroy
    # ボタン連打しても1回しか"いいね"解除できないように"いいね"済みの時のみ処理
    if Book.find(params[:book_id]).favorited_by?(current_user)
      # 削除する
      @favorite = Favorite.find_by(user_id: params[:id], book_id: params[:book_id])
      p params[:id] 
      p params[:book_id]
      p @favorite
      @favorite.delete
    end
    # 画面遷移する
    redirect_to books_path
  end

end
