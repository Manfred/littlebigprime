# frozen_string_literal: true

module Manage
  # Shows a form for a new upload and accepts uploads.
  class UploadsController < ApplicationController
    before_action :require_account

    def new
      @back = manage_videos_url
      @back_title = action_title(controller_path: 'manage/videos', action_name: 'index')
      @upload = Upload.new
    end

    def create
      @upload = Upload.new(params.require(:upload).permit(:uploaded_file))
      @upload.save
      redirect_to manage_videos_path
    end
  end
end
