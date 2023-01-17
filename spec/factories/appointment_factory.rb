# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    description { Faker::Quote.yoda }

    association :doctor_profile, factory: :doctor_profile, strategy: :build
    association :patient_profile, factory: :patient_profile, strategy: :build
  end
end
