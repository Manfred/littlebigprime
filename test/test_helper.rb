# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

ENV['LITTLE_BIG_UPLOAD_PATH'] = Rails.root.join('tmp/test/uploads').to_s

%w[mocks support].each do |path|
  Dir.glob(Rails.root.join('test', path, '*.rb')).each do |filename|
    load filename
  end
end

module ActiveSupport
  class TestCase
    fixtures :all
  end
end

module ActionDispatch
  class IntegrationTest
    include Support::SessionHelpers
  end
end
