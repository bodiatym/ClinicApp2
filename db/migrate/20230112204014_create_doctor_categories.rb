# frozen_string_literal: true

class CreateDoctorCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :doctor_categories do |t|
      t.string :name, null: false, default: ''
      t.timestamps
    end
  end
end
