# frozen_string_literal: true

require_relative '../../test_helper'

module Manage
  class UploadsControllerTest < ActionDispatch::IntegrationTest
    setup do
      FileUtils.rm_rf(Upload.path)
      login_with_account
    end

    test 'shows a new upload form' do
      get '/manage/uploads/new'
      assert_response :ok
    end

    test 'creates a new upload' do
      assert_difference(-> { Upload.count }, +1) do
        post(
          '/manage/uploads',
          params: { upload: { uploaded_file: fixture_file_upload('tiny.mp4', 'video/mp4') } }
        )
      end
      assert_redirected_to manage_videos_url
    end
  end
end
