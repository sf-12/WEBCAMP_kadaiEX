# frozen_string_literal: true

class Room < ApplicationRecord
  #  他のモデルとの関連付け
  has_many :user_rooms, dependent: :destroy
  has_many :chats, dependent: :destroy
end
