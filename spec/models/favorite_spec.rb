require 'rails_helper'

RSpec.describe 'Favoriteモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { favorite.valid? }

    let!(:other_favorite) { create(:favorite) }
    let(:favorite) { build(:favorite) }

    context 'user_idカラム' do
      it '空欄でないこと' do
        favorite.user_id = ''
        expect(subject).to eq false
      end
    end

    context 'book_idカラム' do
      it '空欄でないこと' do
        favorite.book_id = ''
        expect(subject).to eq false
      end
    end

    context 'user_idカラムとbook_idカラム' do
      it '同じ組み合わせは存在しないこと' do
        favorite.user_id = other_favorite.user_id
        p other_favorite
        p other_favorite.book_id
        favorite.book_id = other_favorite.book_id
        p favorite
        expect(subject).to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Bookモデルとの関係' do
      it 'N:1となっている' do
        expect(Favorite.reflect_on_association(:book).macro).to eq :belongs_to
      end
    end
  end

end
