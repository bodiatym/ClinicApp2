# frozen_string_literal: true

# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_user!

    rescue_from CanCan::AccessDenied do |_exception|
      flash[:notice] = 'Access Denied'
      redirect_to root_path
    end

    # Override find_resource, because it initially calls scoped_resource.find(param)
    # which breaks since we are overriding that method as well.
    def find_resource(param)
      resource_class.default_scoped.find(param)
    end

    # Limit the scope of the given resource
    def scoped_resource
      super.accessible_by(current_ability)
    end

    # Raise an exception if the user is not permitted to access this resource
    def authorize_resource(resource)
      raise CanCan::AccessDenied unless show_action?(params[:action], resource)
    end

    # Hide links to actions if the user is not allowed to do them
    def show_action?(action, resource)
      # translate :show action to :read for cancan
      action = :read if ['show', :show].include?(action)
      can? action, resource
    end
  end
end
