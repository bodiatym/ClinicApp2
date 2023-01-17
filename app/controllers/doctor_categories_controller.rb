# frozen_string_literal: true

class DoctorCategoriesController < ApplicationController
  load_and_authorize_resource

  before_action :find_category

  def show
    @facade = DoctorCategories::ShowFacade.new(@category)
  end

  private

  def find_category
    @category = DoctorCategory.find(params[:id])
  end
end
