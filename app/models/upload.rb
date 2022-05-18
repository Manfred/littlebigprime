# frozen_string_literal: true

# Keeps a reference to an upload on disk.
class Upload < ApplicationRecord
  after_initialize -> { self.uuid ||= SecureRandom.uuid }, if: :new_record?
  before_save :move_uploaded_file, if: :new_record?
  after_commit :remove_uploaded_file, on: :destroy

  attr_accessor :uploaded_file

  scope :ordered, -> { order(created_at: :desc, id: :desc) }

  def path
    File.join(self.class.path, uuid)
  end

  def self.path
    @path ||= File.expand_path(ENV.fetch('LITTLE_BIG_UPLOAD_PATH'))
  end

  private

  def move_uploaded_file
    FileUtils.mkdir_p(File.dirname(path))
    FileUtils.mv(uploaded_file.tempfile, path)
  end

  def remove_uploaded_file
    FileUtils.rm(path)
  end

  validates :uploaded_file, presence: true, on: :create
end
