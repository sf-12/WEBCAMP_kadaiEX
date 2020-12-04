# frozen_string_literal: true

class ChangeDataTitleToArticle < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :postcode, :string
    change_column :users, :prefecture_code, :string
  end
end
