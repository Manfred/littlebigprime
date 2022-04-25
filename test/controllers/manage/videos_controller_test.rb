# frozen_string_literal: true

require_relative '../../test_helper'

module Manage
  class VideosControllerTest < ActionDispatch::IntegrationTest
    setup { login_with_account }

    test 'shows all current videos' do
      get '/manage/videos'
      assert_response :ok
    end
  end
end
