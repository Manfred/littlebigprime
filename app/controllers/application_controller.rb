# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action -> { I18n.locale = :nl }
end
