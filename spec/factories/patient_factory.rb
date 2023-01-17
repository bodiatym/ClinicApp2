# frozen_string_literal: true

FactoryBot.define do
  factory :patient do
    name     { Faker::Name.first_name }
    surname  { Faker::Name.last_name }
    phone    { Faker::PhoneNumber }
    password { '123456' }

    trait :with_profile do
      association :patient_profile, factory: :patient_profile, strategy: :build
    end
  end
end
