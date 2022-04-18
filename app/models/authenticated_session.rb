# frozen_string_literal: true

class AuthenticatedSession < ApplicationRecord
  belongs_to :authenticated, polymorphic: true

  after_initialize -> { self.secret = SecureRandom.hex }, if: :new_record?
end
