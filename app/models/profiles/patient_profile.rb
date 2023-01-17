# frozen_string_literal: true

module Profiles
  class PatientProfile < ApplicationRecord
    belongs_to :user, dependent: :destroy
    has_many :appointments
    has_many :doctor_profiles, through: :appointments, class_name: '::Profiles::DoctorProfile'
  end
end
