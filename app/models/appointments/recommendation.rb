# frozen_string_literal: true

module Appointments
  class Recommendation < ApplicationRecord
    belongs_to :appointment

    validates :text, presence: true
  end
end
