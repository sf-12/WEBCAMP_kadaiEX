# frozen_string_literal: true

class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :book_id
      t.boolean :favolit

      t.timestamps
    end
  end
end
