# frozen_string_literal: true

FactoryBot.define do
  factory :doctor_category do
    name { Faker::Name }
  end
end
