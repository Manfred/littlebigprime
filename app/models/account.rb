# frozen_string_literal: true

# Stores accounts for content managers.
class Account < ApplicationRecord
  has_many :authenticated_sessions, as: :authenticated, dependent: :destroy

  def username=(username)
    super(self.class.normalize(username))
  end

  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = self.class.password.create(password)
  end

  def password?(password)
    Argon2::Password.verify_password(password, password_digest)
  end

  def self.password
    Argon2::Password.new
  end

  def self.normalize(username)
    username.to_s.gsub(/[[:space:]]/, '')
  end

  validates :username, presence: true
  validates :password, presence: true
end
