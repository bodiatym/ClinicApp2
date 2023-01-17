# frozen_string_literal: true

FactoryBot.define do
  factory :patient_profile, class: 'Profiles::PatientProfile' do
    association :user, factory: :patient, strategy: :build
  end
end
