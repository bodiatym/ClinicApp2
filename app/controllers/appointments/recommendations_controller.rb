# frozen_string_literal: true
# frozen_string_literal: true

module Appointments
  class RecommendationsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_appointment, only: :create

    load_and_authorize_resource
    def index
      @facade = ::Recommendations::IndexFacade.new(current_user)
    end

    def new
      @recommendation = Recommendation.new
    end

    def create
      @recommendation = Recommendations::CreateService.call(@appointment, recommendation_params[:text])
      return render :new unless @recommendation.persisted?

      flash[:success] = t('flash.success')

      redirect_to appointments_path
    end

    private

    def recommendation_params
      params.require(:appointments_recommendation).permit(:appointment_id, :text)
    end

    def find_appointment
      @appointment = ::Appointment.find(recommendation_params[:appointment_id])
    end
  end
end
