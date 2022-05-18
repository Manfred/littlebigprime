# frozen_string_literal: true

module Manage
  # Allows a content manager to edit videos.
  class VideosController < ApplicationController
    def index
      @back = manage_url
      @back_title = action_title(controller_path: 'manage/pages', action_name: 'index')
      @uploads = Upload.ordered
      @videos = []
    end
  end
end
