class Chat < ApplicationRecord

  # バリデーション設定
  validates :message, presence: true  # 空欄でないこと

  #  他のモデルとの関連付け
  has_many :users, dependent: :destroy
  has_many :rooms, dependent: :destroy

end
