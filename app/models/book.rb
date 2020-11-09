class Book < ApplicationRecord

  # バリデーション設定
  validates :title, presence: true              # 空欄でないこと
  validates :body,  presence: true              # 空欄でないこと
  validates :body,  length: { maximum: 200 }    # 200文字以下

  # Userモデルとの関連付け
  belongs_to :user



end
