# frozen_string_literal: true

require_relative '../test_helper'

class UploadTest < ActiveSupport::TestCase
  test 'returns a path to all uploads on disk' do
    assert_not_nil Upload.path
  end
end
