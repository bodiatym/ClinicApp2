# frozen_string_literal: true

class DoctorCategory < ApplicationRecord
  DEFAULT = 'Default'
  has_many :doctor_profiles, class_name: '::Profiles::DoctorProfile'

  validates :name, uniqueness: true

  def self.default
    DoctorCategory.find_or_create_by(name: DEFAULT)
  end
end
