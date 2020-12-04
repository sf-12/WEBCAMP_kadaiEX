# frozen_string_literal: true

class BookComment < ApplicationRecord
  # バリデーション設定
  validates :user_id, presence: true  # 空欄でないこと
  validates :book_id, presence: true  # 空欄でないこと
  validates :comment, presence: true  # 空欄でないこと

  #  他のモデルとの関連付け
  belongs_to :book
end
