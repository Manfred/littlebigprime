# frozen_string_literal: true

class AuthenticatedSession < ApplicationRecord
  # Creates an authenticated session when the credentials match an account and returns errors
  # otherwise.
  class Create
    include ActiveModel::Model

    attr_accessor :verify, :username, :password

    def save
      valid? && create
    end

    def create
      target.authenticated_sessions.create
    end

    private

    def target
      return @target if defined?(@target)

      @target = find_target
    end

    def find_target
      case verify
      when :account
        find_account
      when :password
        find_password
      end
    end

    def find_account
      account = Account.find_by(username:)
      account if account&.password?(password)
    end

    def find_password
      Password.active.find do |candidate|
        candidate.password?(password)
      end
    end

    validates :target, presence: true
  end
end
