# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Authentication

  default_form_builder ApplicationFormBuilder

  before_action -> { I18n.locale = :nl }

  helper_method :authenticated
end
