# frozen_string_literal: true

module Manage
  # Creates an authenticated session when an account can be authenticated through username and password.
  class SessionsController < ApplicationController
    skip_before_action :require_account

    def new
      @session = AuthenticatedSession::Create.new(verify: :account)
    end

    def create
      @session = AuthenticatedSession::Create.new(account_params)
      @authenticated_session = @session.save
      if @authenticated_session
        start_session(@authenticated_session)
        redirect_to manage_videos_url
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      stop_session
      redirect_to manage_url
    end

    private

    def account_params
      params.require(:authenticated_session_create).permit(:username, :password).merge(verify: :account)
    end
  end
end
