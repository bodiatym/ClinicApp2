# frozen_string_literal: true

module Recommendations
  class IndexFacade
    attr_reader :recommendations

    def initialize(user)
      @current_user = user
      @recommendations = recommendations_query.decorate
    end

    private

    def recommendations_query
      Appointments::Recommendation.joins(:appointment).where(appointments: { patient_profile_id: @current_user.profile.id })
    end
  end
end
