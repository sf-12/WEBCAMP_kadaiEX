# frozen_string_literal: true

class Favorite < ApplicationRecord
  # バリデーション設定
  validates :user_id,   presence: true                                # 空欄でないこと
  validates :book_id,   presence: true                                # 空欄でないこと
  validates :user_id,   uniqueness: { scope: %i[book_id] }            # ユーザは1つの投稿に1つしか"いいね"できない

  #  他のモデルとの関連付け
  belongs_to :book
end
