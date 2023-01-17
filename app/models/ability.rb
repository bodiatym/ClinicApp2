# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    if user.type == ::User::PATIENT
      can :read, ::Profiles::PatientProfile, user: user
      can :read, ::Profiles::DoctorProfile, user: user
      can :read, ::Appointments::Recommendation, appointment: { patient_profile: user.profile }
      can :read, ::DoctorCategory
      can :create, ::Appointment, patient_profile: user.profile
    end

    if user.type == ::User::DOCTOR
      can :read, ::Profiles::DoctorProfile, user: user
      can :read, ::Appointment, doctor_profile: user.profile
      can :create, ::Appointments::Recommendation, appointment: { doctor_profile: user.profile }
    end
    return unless user.type == ::User::SUPER_ADMIN

    can :manage, :all
  end
end
