class UserRoom < ApplicationRecord

  #  他のモデルとの関連付け
  has_many :users, dependent: :destroy
  has_many :rooms, dependent: :destroy

end
