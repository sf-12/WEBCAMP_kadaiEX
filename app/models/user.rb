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
  has_many :book_comments

  # フォローする関係
  has_many :follow_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  # @user.followinhgsで、ユーザがフォローしている人の一覧を出す
  has_many :followings, through: :follow_relationships, source: :followed

  # フォローされる関係
  has_many :followed_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  # @user.followedsで、ユーザをフォローしている人の一覧を出す
  has_many :followeds, through: :followed_relationships, source: :follower


  # refile用の設定
  attachment :profile_image

  #  あるユーザを自分がフォローしているか調べる
  def following?(target_user)
    self.followings.include?(target_user)
  end


  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

end
