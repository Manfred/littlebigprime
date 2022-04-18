# frozen_string_literal: true

require_relative '../test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test 'shows a homepage' do
    get '/'
    assert_response :ok
  end
end
