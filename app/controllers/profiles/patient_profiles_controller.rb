# frozen_string_literal: true

module Profiles
  class PatientProfilesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_profile

    load_and_authorize_resource

    def show
      @facade = Profiles::PatientShowFacade.new(@profile)
    end

    def set_profile
      @profile = current_user.profile
    end
  end
end
