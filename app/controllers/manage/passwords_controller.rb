# frozen_string_literal: true

module Manage
  # Allows a content manager to change the password.
  class PasswordsController < ApplicationController
    before_action :require_account

    def index
      @passwords = Password.newest_first
    end

    def new
      @password = Password.new
    end

    def create
      @password = Password.new(create_password_params)
      if @password.save
        redirect_to manage_passwords_url
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      @password = Password.find(params[:id])
      if @password.update(update_password_params)
        redirect_to manage_password_url
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def create_password_params
      params.require(:password).permit(:plain_text)
    end

    def update_password_params
      params.require(:password).permit(:deactivate)
    end
  end
end
