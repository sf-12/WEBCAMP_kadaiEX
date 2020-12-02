class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    # ボタン連打しても1回しか"いいね"できないように"いいね"してない時のみ処理
    if not @book.favorited_by?(current_user)
      # 登録する
      @favorite = Favorite.new
      @favorite.user_id = current_user.id
      @favorite.book_id = params[:book_id]
      @favorite.save
    end
    # 元の画面に遷移する
    # redirect_to request.referer
  end

  def destroy
    @book = Book.find(params[:book_id])
    # ボタン連打しても1回しか"いいね"解除できないように"いいね"済みの時のみ処理
    if @book.favorited_by?(current_user)
      # 削除する
      @favorite = Favorite.find_by(user_id: params[:id], book_id: params[:book_id])
      @favorite.delete
    end
    # 元の画面に遷移する
    # redirect_to request.referer
  end

end
