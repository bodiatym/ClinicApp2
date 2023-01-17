# frozen_string_literal: true

class CreateDoctorProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :doctor_profiles do |t|
      t.belongs_to :user, index: { unique: true }, foreign_key: true

      t.timestamps null: false
    end
  end
end
