# frozen_string_literal: true

require_relative '../../test_helper'

module Manage
  class PasswordsControllerTest < ActionDispatch::IntegrationTest
    setup { login_with_account }

    test 'shows all current passwords' do
      get '/manage/passwords'
      assert_response :ok
    end
  end
end
