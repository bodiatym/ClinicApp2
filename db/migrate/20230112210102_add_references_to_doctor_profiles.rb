# frozen_string_literal: true

class AddReferencesToDoctorProfiles < ActiveRecord::Migration[6.1]
  def change
    add_reference :doctor_profiles, :doctor_category, foreign_key: true
  end
end
