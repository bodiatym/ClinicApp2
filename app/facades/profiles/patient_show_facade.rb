# frozen_string_literal: true

module Profiles
  class PatientShowFacade
    attr_reader :profile

    delegate :full_name, :user, to: :profile
    delegate :type, to: :user

    def initialize(profile)
      @profile = profile.decorate
    end
  end
end
