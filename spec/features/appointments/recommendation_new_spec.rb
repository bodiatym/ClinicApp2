# frozen_string_literal: true

require 'rails_helper'

describe 'Recommendation #new', type: :feature do
  let(:doctor)      { create(:doctor, :with_profile) }
  let(:appointment) { create(:appointment, doctor_profile: doctor.doctor_profile) }
  let(:params)      { { appointments_recommendation: { appointment_id: appointment.id } } }
  let(:text)        { Faker::Quote.robin }

  before do
    login_as(doctor)

    visit new_appointments_recommendation_path(params)
  end

  scenario 'create recommendation with text' do
    fill_in 'appointments_recommendation_text', with: text

    click_button 'Submit'

    expect(page).to have_content('Success')
  end

  scenario 'create recommendation without text' do
    fill_in 'appointments_recommendation_text', with: ''

    click_button 'Submit'

    expect(page).to have_content('error')
  end
end
