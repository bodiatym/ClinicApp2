# frozen_string_literal: true

module Appointments
  class CreateService < ApplicationService
    MAX_COUNT = 10

    attr_reader :patient_profile, :doctor_profile, :description

    def initialize(user, doctor_profile, description)
      super()
      @user = user
      @patient_profile = user.profile
      @doctor_profile = doctor_profile
      @description = description
    end

    def call
      if active_appointments_count < MAX_COUNT
        return Appointment.create(patient_profile: patient_profile, doctor_profile: doctor_profile,
                                  description: description)
      end
      appointment = Appointment.new
      appointment.errors[:base] << I18n.t('flash.appointment.create.doctor_max')
      appointment
    end

    private

    def active_appointments_count
      @doctor_profile.appointments.active.count
    end
  end
end
