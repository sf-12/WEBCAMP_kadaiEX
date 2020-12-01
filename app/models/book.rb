class Book < ApplicationRecord

  # バリデーション設定
  validates :title, presence: true              # 空欄でないこと
  validates :body,  presence: true              # 空欄でないこと
  validates :body,  length: { maximum: 200 }    # 200文字以下

  #  他のモデルとの関連付け
  belongs_to :user
  has_many :favorites, dependent: :destroy


    # ユーザーが"いいね"したか調べる
  def favorited_by?(user)
    self.favorites.where(user_id: user.id).exists?
  end

    # "いいね"されている数を返す
  def favorited_count
    if self.favorites.exists?
      return self.favorites.count.to_s
    else
      return "0".to_s
    end
  end
end
