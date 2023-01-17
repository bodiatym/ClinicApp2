# frozen_string_literal: true

module Profiles
  class DoctorProfilesController < ApplicationController
    before_action :authenticate_user!, only: :show
    before_action :set_profile, only: :show

    load_and_authorize_resource

    def index
      @facade = ::Profiles::DoctorIndexFacade.new
    end

    def show
      @facade = ::Profiles::DoctorShowFacade.new(@profile)
    end

    def set_profile
      @profile = current_user.profile
    end
  end
end
