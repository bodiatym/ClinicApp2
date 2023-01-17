# frozen_string_literal: true

RSpec.describe Appointments::RecommendationsController, type: :controller do
  describe 'POST create' do
    let(:doctor)      { create(:doctor, :with_profile) }
    let(:appointment) { create(:appointment, doctor_profile: doctor.doctor_profile) }

    let(:valid_attributes) do
      {
        appointment_id: appointment.id,
        text: Faker::Quote.robin
      }
    end

    let(:invalid_attributes) do
      {
        appointment_id: appointment.id
      }
    end

    before(:each) do
      sign_in doctor
    end

    context 'with valid params' do
      it 'creates a new Recommendation' do
        expect do
          post :create, params: { appointments_recommendation: valid_attributes }
        end.to change(Appointments::Recommendation, :count).by(1)
      end

      it 'assigns a newly created recommendation as @recommendation' do
        post :create, params: { appointments_recommendation: valid_attributes }
        assigns(:recommendation).should be_a(Appointments::Recommendation)
        assigns(:recommendation).should be_persisted
      end

      it 'redirects to the appointments index' do
        post :create, params: { appointments_recommendation: valid_attributes }
        response.should redirect_to(appointments_path)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved recommendation as @recommendation' do
        post :create, params: { appointments_recommendation: invalid_attributes }
        assigns(:recommendation).should be_a_new(Appointments::Recommendation)
      end

      it "re-renders the 'new' template" do
        post :create, params: { appointments_recommendation: invalid_attributes }
        response.should render_template('new')
      end
    end
  end
end
