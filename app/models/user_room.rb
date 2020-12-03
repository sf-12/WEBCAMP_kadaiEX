class UserRoom < ApplicationRecord

  #  他のモデルとの関連付け
  has_many :user_id, dependent: :destroy
  has_many :room_id, dependent: :destroy

end
