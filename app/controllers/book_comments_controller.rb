class BookCommentsController < ApplicationController
  def create
    # 登録する
    @book_comment = BookComment.new(comment_params)
    @book_comment.user_id = current_user.id
    @book_comment.book_id = params[:book_id]
    @book_comment.save
    # 元の画面に遷移する
    redirect_to request.referer
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
