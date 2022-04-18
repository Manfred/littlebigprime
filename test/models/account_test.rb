# frozen_string_literal: true

require_relative '../test_helper'

class AccountTest < ActiveSupport::TestCase
  test 'validation disallows empty username or password' do
    account = Account.new
    assert_not account.valid?
    assert_equal(
      { username: [{ error: :blank }], password: [{ error: :blank }] },
      account.errors.details
    )
  end

  test 'digests passwords' do
    account = Account.new(password: 'very-secret')
    assert_not_nil account.password_digest
    assert_not account.password?(nil)
    assert_not account.password?('')
    assert_not account.password?('false')
    assert account.password?('very-secret')
  end

  test 'verifies password for persisted account' do
    assert_not accounts(:lilly).password?(nil)
    assert_not accounts(:lilly).password?('')
    assert_not accounts(:lilly).password?('false')
    assert accounts(:lilly).password?('secret')
  end

  test 'prevents empty space in usernames' do
    account = Account.new(username: ' hi ')
    assert_equal 'hi', account.username
  end
end
