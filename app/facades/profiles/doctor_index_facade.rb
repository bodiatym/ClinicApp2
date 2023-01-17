# frozen_string_literal: true

module Profiles
  class DoctorIndexFacade
    attr_reader :profiles, :categories

    def initialize
      @profiles = ::Profiles::DoctorProfile.all.decorate
      @categories = ::DoctorCategory.all
    end
  end
end
