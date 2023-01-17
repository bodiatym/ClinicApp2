# frozen_string_literal: true

module Profiles
  class DoctorProfileDecorator < Draper::Decorator
    delegate_all

    delegate :name, :surname, to: :user
    delegate :name, to: :doctor_category, prefix: :category

    def full_name
      "#{name} #{surname}"
    end
  end
end
