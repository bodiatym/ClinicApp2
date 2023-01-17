# frozen_string_literal: true

module Appointments
  class RecommendationDecorator < Draper::Decorator
    delegate_all
    decorates_association :appointment, with: AppointmentDecorator

    delegate :doctor_profile, to: :appointment
    delegate :full_name, :category_name, to: :doctor_profile, prefix: :doctor
  end
end
