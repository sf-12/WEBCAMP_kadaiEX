class SearchesController < ApplicationController
  def search

    # 検索フォームから取得した情報
    @search_name = params[:name]        # 名前
    @search_target = params[:target]    # 検索するもの（User or Book）
    @search_how = params[:how]          # 検索手法（完全一致 or 前方一致 or 後方一致 or 部分一致）

    if @search_target == "User"
      # 名前検索
      case @search_how
      when "perfect" then
        # 完全一致
        @results = User.where('name like ?', @search_name.to_s)
      when "forward" then
        # 前方一致
        @results = User.where('name like ?', @search_name.to_s + '%')
      when "back" then
        # 後方一致
        @results = User.where('name like ?', '%' + @search_name.to_s)
      else
        # 部分一致
        @results = User.where('name like ?', '%' + @search_name.to_s + '%')
      end
    else
      # 書籍検索
      case @search_how
      when "perfect" then
        # 完全一致
        @results = Book.where('title like ?', @search_name.to_s)
      when "forward" then
        # 前方一致
        @results = Book.where('title like ?', @search_name.to_s + '%')
      when "back" then
        # 後方一致
        @results = Book.where('title like ?', '%' + @search_name.to_s)
      else
        # 部分一致
        @results = Book.where('title like ?', '%' + @search_name.to_s + '%')
      end
    end
  end
end
