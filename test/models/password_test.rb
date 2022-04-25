# frozen_string_literal: true

require_relative '../test_helper'

class PasswordTest < ActiveSupport::TestCase
  test 'validation disallows empty plain text' do
    password = Password.new
    assert_not password.valid?
    assert_equal(
      { plain_text: [{ error: :blank }] },
      password.errors.details
    )
  end

  test 'digests passwords' do
    password = Password.new(plain_text: 'very-secret')
    assert_not_nil password.digest
    assert_not password.password?(nil)
    assert_not password.password?('')
    assert_not password.password?('false')
    assert password.password?('very-secret')
  end

  test 'verifies password for persisted password' do
    assert_not passwords(:secret).password?(nil)
    assert_not passwords(:secret).password?('')
    assert_not passwords(:secret).password?('false')
    assert passwords(:secret).password?('secret')
  end
end
