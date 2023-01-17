# frozen_string_literal: true

class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.belongs_to :doctor_profile
      t.belongs_to :patient_profile
      t.string     :status, default: ::Appointment::ACTIVE, null: false
      t.text       :description

      t.timestamps
    end
    add_index :appointments, :status
  end
end
