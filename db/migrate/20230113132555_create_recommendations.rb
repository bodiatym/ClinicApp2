# frozen_string_literal: true

class CreateRecommendations < ActiveRecord::Migration[6.1]
  def change
    create_table :recommendations do |t|
      t.belongs_to :appointment, index: { unique: true }, foreign_key: true
      t.text       :text
      t.timestamps
    end
  end
end
