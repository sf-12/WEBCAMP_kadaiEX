# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { user.valid? }

    let!(:other_user) { create(:user) }
    let(:user) { build(:user) }

    context 'nameカラム' do
      it '空欄でないこと' do
        user.name = ''
        expect(subject).to eq false
      end

      it '2文字以上であること: 1文字は×' do
        user.name = Faker::Lorem.characters(number: 1)
        expect(subject).to eq false
      end

      it '2文字以上であること: 2文字は〇' do
        user.name = Faker::Lorem.characters(number: 2)
        expect(subject).to eq true
      end

      it '20文字以下であること: 20文字は〇' do
        user.name = Faker::Lorem.characters(number: 20)
        expect(subject).to eq true
      end

      it '20文字以下であること: 21文字は×' do
        user.name = Faker::Lorem.characters(number: 21)
        expect(subject).to eq false
      end

      it '一意性があること' do
        user.name = other_user.name
        expect(subject).to eq false
      end
    end

    context 'introductionカラム' do
      it '50文字以下であること: 50文字は〇' do
        user.introduction = Faker::Lorem.characters(number: 50)
        expect(subject).to eq true
      end

      it '50文字以下であること: 51文字は×' do
        user.introduction = Faker::Lorem.characters(number: 51)
        expect(subject).to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Bookモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:books).macro).to eq :has_many
      end
    end
  end
end
