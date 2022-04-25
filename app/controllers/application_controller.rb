# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Authentication

  default_form_builder ApplicationFormBuilder

  before_action -> { I18n.locale = :nl }

  helper_method :authenticated

  private

  def require_password
    head :forbidden unless authenticated.is_a?(Password)
  end
end
