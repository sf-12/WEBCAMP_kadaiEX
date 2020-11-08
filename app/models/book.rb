class Book < ApplicationRecord

  # Userモデルとの関連付け
  belongs_to :user
end
