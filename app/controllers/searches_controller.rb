# frozen_string_literal: true

class SearchesController < ApplicationController
  def search
    # 検索フォームから取得した情報
    @search_name = params[:name]        # 名前
    @search_target = params[:target]    # 検索するもの（User or Book）
    @search_how = params[:how]          # 検索手法（完全一致 or 前方一致 or 後方一致 or 部分一致）

    @results = if @search_target == 'User'
                 # 名前検索
                 case @search_how
                 when 'perfect'
                   # 完全一致
                   User.where('name like ?', @search_name.to_s)
                 when 'forward'
                   # 前方一致
                   User.where('name like ?', "#{@search_name}%")
                 when 'back'
                   # 後方一致
                   User.where('name like ?', "%#{@search_name}")
                 else
                   # 部分一致
                   User.where('name like ?', "%#{@search_name}%")
                 end
               else
                 # 書籍検索
                 case @search_how
                 when 'perfect'
                   # 完全一致
                   Book.where('title like ?', @search_name.to_s)
                 when 'forward'
                   # 前方一致
                   Book.where('title like ?', "#{@search_name}%")
                 when 'back'
                   # 後方一致
                   Book.where('title like ?', "%#{@search_name}")
                 else
                   # 部分一致
                   Book.where('title like ?', "%#{@search_name}%")
                 end
               end
  end
end
