class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # バリデーション設定
  validates :name,          presence: true              # 空欄でないこと
  validates :name,          length: { minimum: 2 }      # 2文字以上
  validates :name,          length: { maximum: 20 }     # 20文字以下
  validates :name,          uniqueness: true            # 一意であること
  validates :introduction,  length: { maximum: 50 }     # 50文字以下


  #  他のモデルとの関連付け
  has_many :books, dependent: :destroy
  has_many :favorites

  # refile用の設定
  attachment :profile_image
end
