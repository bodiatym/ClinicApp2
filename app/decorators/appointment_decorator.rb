# frozen_string_literal: true

class AppointmentDecorator < Draper::Decorator
  delegate_all
  decorates_association :doctor_profile, with: Profiles::DoctorProfileDecorator
end
