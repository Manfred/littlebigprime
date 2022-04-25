# frozen_string_literal: true

# Stores the password used to access the service. Multiple passwords can be active at the same time.
class Password < ApplicationRecord
  has_many :authenticated_sessions, as: :authenticated, dependent: :destroy

  attr_reader :plain_text

  scope :active, -> { where(deactivated_at: nil) }
  scope :newest_first, -> { order(created_at: :desc, id: :desc) }

  def deactivate=(deactivate)
    self.deactivated_at = (Time.zone.now if deactivate)
  end

  def plain_text=(plain_text)
    @plain_text = plain_text
    self.prefix = plain_text.to_s[0, 3]
    self.digest = self.class.password.create(plain_text)
  end

  def password?(password)
    Argon2::Password.verify_password(password, digest)
  end

  def self.password
    Argon2::Password.new
  end

  validates :plain_text, presence: true, on: :create
end
