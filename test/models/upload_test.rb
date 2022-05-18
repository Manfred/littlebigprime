# frozen_string_literal: true

require_relative '../test_helper'

class UploadTest < ActiveSupport::TestCase
  setup { FileUtils.rm_rf(Upload.path) }

  test 'returns a path to all uploads on disk' do
    assert_not_nil Upload.path
  end

  test 'creates with an uploaded file and deletes when destroyed' do
    filename = Rails.root.join('tmp/upload.mp4').to_s
    FileUtils.cp(Rails.root.join('test/fixtures/files/tiny.mp4').to_s, filename)

    File.open(filename) do |file|
      uploaded_file = ActionDispatch::Http::UploadedFile.new(
        filename: 'IMG_2933.MOV',
        type: 'video/mp4',
        tempfile: file
      )
      upload = Upload.create(uploaded_file:)
      assert File.exist?(upload.path)

      upload.destroy
      assert_not File.exist?(upload.path)
    end
  end
end
