# frozen_string_literal: true

require_relative '../test_helper'

class AuthenticatedSessionTest < ActiveSupport::TestCase
  test 'creates a session for an account' do
    account = accounts(:lilly)
    authenticated_session = account.authenticated_sessions.create
    assert_equal account, authenticated_session.authenticated
    assert_not_nil authenticated_session.secret
  end
end
