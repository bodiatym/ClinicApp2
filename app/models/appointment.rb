# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :doctor_profile, class_name: '::Profiles::DoctorProfile'
  belongs_to :patient_profile, class_name: '::Profiles::PatientProfile'
  has_one :recommendation, dependent: :destroy, class_name: 'Appointments::Recommendation'

  enum status: {
    active: ACTIVE = 'active',
    closed: CLOSED = 'closed'
  }
end
