class Chat < ApplicationRecord

  # バリデーション設定
  validates :message, presence: true  # 空欄でないこと

  #  他のモデルとの関連付け
  has_many :user_id, dependent: :destroy
  has_many :room_id, dependent: :destroy

end
