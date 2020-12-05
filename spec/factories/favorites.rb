# frozen_string_literal: true

FactoryBot.define do
  factory :favorite do
    user_id { Faker::Number.number(digits: 5) }
    book_id { Faker::Number.number(digits: 5) }
    book
  end
end
