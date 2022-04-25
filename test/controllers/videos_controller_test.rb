# frozen_string_literal: true

require_relative '../test_helper'

class VideosControllerTest < ActionDispatch::IntegrationTest
  setup { login_with_password }

  test 'shows a list of all published videos' do
    get '/videos'
    assert_response :ok
  end
end
