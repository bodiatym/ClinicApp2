# frozen_string_literal: true

module Recommendations
  class CreateService < ApplicationService
    attr_reader :appointment, :text

    def initialize(appointment, text)
      super()
      @appointment = appointment
      @text = text
    end

    def call
      ::Appointments::Recommendation.transaction do
        recommendation.save
        appointment.closed!
      end
      recommendation
    end

    private

    def recommendation
      @recommendation ||= ::Appointments::Recommendation.new(appointment: appointment, text: text)
    end
  end
end
