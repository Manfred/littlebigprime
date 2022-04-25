# frozen_string_literal: true

# Creates an authenticated session when a subscription password is verified.
class SessionsController < ApplicationController
  def new
    @session = AuthenticatedSession::Create.new(verify: :password)
  end

  def create
    @session = AuthenticatedSession::Create.new(account_params)
    @authenticated_session = @session.save
    if @authenticated_session
      start_session(@authenticated_session)
      redirect_to videos_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    stop_session
    redirect_to root_url
  end

  private

  def account_params
    params.require(:authenticated_session_create).permit(:password).merge(verify: :password)
  end
end
