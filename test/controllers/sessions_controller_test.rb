# frozen_string_literal: true

require_relative '../test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'shows a form to sign in' do
    get '/session/new'
    assert_response :ok
  end

  test 'allows login with correct password' do
    post '/session', params: { authenticated_session_create: { password: 'secret' } }
    assert_redirected_to videos_url
  end

  test 'disallows login with incorrect password' do
    post '/session', params: { authenticated_session_create: { password: 'wrong' } }
    assert_response :unprocessable_entity
  end

  test 'disallows login without password' do
    post '/session', params: { authenticated_session_create: { password: '' } }
    assert_response :unprocessable_entity
  end
end
