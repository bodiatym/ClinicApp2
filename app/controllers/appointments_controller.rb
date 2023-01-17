# frozen_string_literal: true

class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_doctor_profile, only: :create

  load_and_authorize_resource

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointments::CreateService.call(current_user, @doctor_profile, appointment_params[:description])
    return render :new unless @appointment.persisted?

    flash[:success] = t('flash.appointment.create.success')

    redirect_to doctor_profiles_path
  end

  def index
    @appointments = current_user.profile.appointments.active
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_profile_id, :description)
  end

  def find_doctor_profile
    @doctor_profile = ::Profiles::DoctorProfile.find(appointment_params[:doctor_profile_id])
  end
end
