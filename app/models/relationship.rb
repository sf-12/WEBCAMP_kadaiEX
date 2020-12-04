# frozen_string_literal: true

class Relationship < ApplicationRecord
  # バリデーション設定
  validates :id,          uniqueness: { scope: %i[follower_id followed_id] } # ユーザを二重にフォローすることはできない
  validates :follower_id, presence: true                                        # 空欄でないこと
  validates :followed_id, presence: true                                        # 空欄でないこと

  #  他のモデルとの関連付け
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'
end
