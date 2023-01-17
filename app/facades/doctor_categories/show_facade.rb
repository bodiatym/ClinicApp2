# frozen_string_literal: true

module DoctorCategories
  class ShowFacade
    attr_reader :profiles, :categories

    def initialize(category)
      @category = category
      @profiles = category.doctor_profiles.decorate
      @categories = ::DoctorCategory.all
    end
  end
end
