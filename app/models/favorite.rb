class Favorite < ApplicationRecord
  
  # バリデーション設定
  validates :id,        uniqueness: { scope: [:user_id, :book_id] }    # ユーザは1つの投稿に1つしか"いいね"できない
  validates :user_id,   presence: true                                # 空欄でないこと
  validates :book_id,   presence: true                                # 空欄でないこと

  #  他のモデルとの関連付け
  belongs_to :book


end
