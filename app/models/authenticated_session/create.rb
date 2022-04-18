# frozen_string_literal: true

class AuthenticatedSession < ApplicationRecord
  # Creates an authenticated session when the credentials match an account and returns errors
  # otherwise.
  class Create
    include ActiveModel::Model

    attr_accessor :username, :password

    def save
      valid? && create
    end

    def create
      account.authenticated_sessions.create
    end

    private

    def account
      return @account if defined?(@account)

      @account = Account.find_by(username:)
    end

    def password_matches
      return unless account
      return if account.password?(password)

      errors.add(:password, :does_not_match)
    end

    validates :account, presence: true
    validate :password_matches
  end
end
