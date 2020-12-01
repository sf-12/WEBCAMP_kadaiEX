class BookCommentsController < ApplicationController
  def create
    # 登録する
    @new_comment = BookComment.new(comment_params)
    @new_comment.user_id = current_user.id
    @new_comment.book_id = params[:book_id]
    if @new_comment.save
      # 元の画面に遷移する
      redirect_to request.referer
    else
      # 元の画面に遷移する
      # バリデーションエラーを表示しようとすると、URL変化が厄介なので暫定でエラー非表示
      # @book = Book.find(params[:book_id])
      # @user = User.find_by(id: @book.user_id)
      # @book_comments = BookComment.where(book_id: @book.id)
      # render template: 'books/show'
      redirect_to request.referrer
    end

  end

  def destroy
    # 削除する
    @book_comment = BookComment.find_by(id: params[:id])
    p params[:id]
    p params[:book_id]
    p @book_comment
    @book_comment.delete
    # 元の画面に遷移する
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:new_comment).permit(:comment)
  end

end
