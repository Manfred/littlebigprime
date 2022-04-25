# frozen_string_literal: true

require_relative '../../test_helper'

class AuthenticatedSession
  class CreateTest < ActiveSupport::TestCase
    test 'creates an authenticated session for an account' do
      create = AuthenticatedSession::Create.new(verify: :account, username: 'lilly', password: 'secret')
      authenticated_session = create.save
      assert_equal accounts(:lilly), authenticated_session.authenticated
    end

    test 'returns a target error for an unknown account' do
      create = AuthenticatedSession::Create.new(verify: :account, username: 'unkown', password: 'secret')
      assert_not create.save
      assert_equal({ target: [{ error: :blank }] }, create.errors.details)
    end

    test 'returns a target error when password does not match' do
      create = AuthenticatedSession::Create.new(verify: :account, username: 'lilly', password: 'wrong')
      assert_not create.save
      assert_equal({ target: [{ error: :blank }] }, create.errors.details)
    end

    test 'creates an authenticated session for a password' do
      create = AuthenticatedSession::Create.new(verify: :password, password: 'secret')
      authenticated_session = create.save
      assert_equal passwords(:secret), authenticated_session.authenticated
    end

    test 'returns a target error for an unknown password' do
      create = AuthenticatedSession::Create.new(verify: :password, password: 'wrong')
      assert_not create.save
      assert_equal({ target: [{ error: :blank }] }, create.errors.details)
    end
  end
end
