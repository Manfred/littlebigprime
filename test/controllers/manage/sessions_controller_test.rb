# frozen_string_literal: true

require_relative '../../test_helper'

module Manage
  class SessionsControllerTest < ActionDispatch::IntegrationTest
    test 'shows a form to sign in' do
      get '/manage/session/new'
      assert_response :ok
    end

    test 'allows login with correct password' do
      post '/manage/session', params: { authenticated_session_create: { username: 'lilly', password: 'secret' } }
      assert_redirected_to manage_videos_url
    end

    test 'disallows login with incorrect password' do
      post '/manage/session', params: { authenticated_session_create: { username: 'lilly', password: 'wrong' } }
      assert_response :unprocessable_entity
    end

    test 'disallows login without password' do
      post '/manage/session', params: { authenticated_session_create: { username: 'lilly', password: '' } }
      assert_response :unprocessable_entity
    end

    test 'disallows login with incorrect username' do
      post '/manage/session', params: { authenticated_session_create: { username: 'unknown', password: 'secret' } }
      assert_response :unprocessable_entity
    end
  end
end
