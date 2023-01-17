# frozen_string_literal: true

module Profiles
  class PatientProfileDecorator < Draper::Decorator
    delegate_all

    delegate :name, :surname, to: :user

    def full_name
      "#{name} #{surname}"
    end
  end
end
