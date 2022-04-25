# frozen_string_literal: true

module Manage
  class ApplicationController < ApplicationController
    layout 'manage'

    private

    def require_account
      head :forbidden unless authenticated.is_a?(Account)
    end
  end
end
