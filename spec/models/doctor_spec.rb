# frozen_string_literal: true

require 'rails_helper'

describe Doctor, type: :model do
  subject { described_class.new(params) }

  let(:params) do
    {
      name: Faker::Name.first_name,
      surname: Faker::Name.last_name,
      phone: Faker::PhoneNumber,
      password: '123456',
      password_confirmation: '123456'
    }
  end

  it { should validate_uniqueness_of(:phone) }

  it 'is valid with attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a phone' do
    subject.phone = nil
    expect(subject).to_not be_valid
  end
end
