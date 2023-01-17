# frozen_string_literal: true

module Profiles
  class CreateService < ApplicationService
    attr_reader :user

    def initialize(user)
      super()
      @user = user
    end

    def call
      profile = select_type.constantize.create(user: user)
      set_default_category(profile) if user.type == User::DOCTOR && profile.persisted?
    end

    private

    def set_default_category(profile)
      profile.update(doctor_category: DoctorCategory.default)
    end

    def select_type
      "Profiles::#{user.type}Profile"
    end
  end
end
