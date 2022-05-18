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

  attr_writer :page_title

  def page_title
    @page_title || action_title
  end
  helper_method :page_title

  def action_title(controller_path: nil, action_name: nil, **kwargs)
    action_name ||= self.action_name
    controller_path ||= self.controller_path
    I18n.t("#{controller_path.gsub('/', '.')}.#{action_name}.page_title", **kwargs)
  end
  helper_method :action_title
end
