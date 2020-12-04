# frozen_string_literal: true

class BookCommentsController < ApplicationController
  def create
    # 登録する
    @book = Book.find(params[:book_id])
    @book_comments = BookComment.where(book_id: @book.id)
    @new_comment = BookComment.new(comment_params)
    @new_comment.user_id = current_user.id
    @new_comment.book_id = @book.id
    @new_comment.save
    # 元の画面に遷移する
    # redirect_to request.referer
    # バリデーションエラーを表示しようとすると、URL変化が厄介なので暫定でエラー非表示
  end

  def destroy
    # 削除する
    @book = Book.find(params[:book_id])
    @book_comments = BookComment.where(book_id: @book.id)
    @book_comment = BookComment.find_by(id: params[:id])
    @book_comment.delete
    # 元の画面に遷移する
    # redirect_to request.referer
  end

  private

  def comment_params
    params.require(:new_comment).permit(:comment)
  end
end
