# frozen_string_literal: true

# Keeps a reference to an upload on disk.
class Upload < ApplicationRecord
  def self.path
    @path ||= File.expand_path(ENV.fetch('LITTLE_BIG_UPLOAD_PATH'))
  end
end
