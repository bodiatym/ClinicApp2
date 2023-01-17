# frozen_string_literal: true

FactoryBot.define do
  factory :doctor_profile, class: 'Profiles::DoctorProfile' do
    association :user, factory: :doctor, strategy: :build
    association :doctor_category, factory: :doctor_category, strategy: :build
  end
end
