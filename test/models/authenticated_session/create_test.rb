# frozen_string_literal: true

require_relative '../../test_helper'

class AuthenticatedSession
  class CreateTest < ActiveSupport::TestCase
    test 'creates an authenticated session for an account' do
      create = AuthenticatedSession::Create.new(username: 'lilly', password: 'secret')
      authenticated_session = create.save
      assert_equal accounts(:lilly), authenticated_session.authenticated
    end

    test 'returns an account error for an unknown account' do
      create = AuthenticatedSession::Create.new(username: 'unkown', password: 'secret')
      assert_not create.save
      assert_equal({ account: [{ error: :blank }] }, create.errors.details)
    end

    test 'returns a password error for an bad password' do
      create = AuthenticatedSession::Create.new(username: 'lilly', password: 'wrong')
      assert_not create.save
      assert_equal({ password: [{ error: :does_not_match }] }, create.errors.details)
    end
  end
end
