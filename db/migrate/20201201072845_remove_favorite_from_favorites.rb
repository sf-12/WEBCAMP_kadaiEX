# frozen_string_literal: true

class RemoveFavoriteFromFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :favorite, :boolean
  end
end
