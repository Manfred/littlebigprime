# frozen_string_literal: true

module Manage
  # Creates an authenticated session when an account can be authenticated through username and password.
  class SessionsController < ApplicationController
    def new
      @session = AuthenticatedSession::Create.new
    end

    def create
      @session = AuthenticatedSession::Create.new(account_params)
      @authenticated_session = @session.save
      if @authenticated_session
        start_session(@authenticated_session)
        redirect_to manage_videos_url
      else
        render :new
      end
    end

    def destroy
      stop_session
      redirect_to manage_url
    end

    private

    def account_params
      params.require(:authenticated_session_create).permit(:username, :password)
    end
  end
end
