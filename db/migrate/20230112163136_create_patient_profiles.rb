# frozen_string_literal: true

class CreatePatientProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :patient_profiles do |t|
      t.belongs_to :user, index: { unique: true }, foreign_key: true

      t.timestamps null: false
    end
  end
end
