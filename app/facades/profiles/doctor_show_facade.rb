# frozen_string_literal: true

module Profiles
  class DoctorShowFacade
    attr_reader :profile

    delegate :full_name, :user, :category_name, to: :profile
    delegate :type, to: :user

    def initialize(profile)
      @profile = profile.decorate
    end
  end
end
