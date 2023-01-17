# frozen_string_literal: true

module Profiles
  class DoctorProfile < ApplicationRecord
    belongs_to :user, dependent: :destroy
    belongs_to :doctor_category, optional: true
    has_many :appointments
    has_many :patient_profiles, through: :appointments, class_name: '::Profiles::PatientProfile'
  end
end
