# frozen_string_literal: true

class User < ApplicationRecord
  USER_TYPES = %w[Patient Doctor].freeze
  PATIENT = 'Patient'
  DOCTOR = 'Doctor'
  SUPER_ADMIN = 'SuperAdmin'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :phone, uniqueness: true, presence: true

  has_one :patient_profile, dependent: :destroy, class_name: '::Profiles::PatientProfile'
  has_one :doctor_profile, dependent: :destroy, class_name: '::Profiles::DoctorProfile'

  def profile
    type == PATIENT ? patient_profile : doctor_profile
  end

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
end
