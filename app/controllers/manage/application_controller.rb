# frozen_string_literal: true

module Manage
  class ApplicationController < ApplicationController
    layout 'manage'

    before_action :require_account

    private

    def require_account
      if authenticated
        head :forbidden unless authenticated.is_a?(Account)
      else
        redirect_to new_manage_session_url
      end
    end
  end
end
