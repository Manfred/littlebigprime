# frozen_string_literal: true

module Manage
  # Allows a content manager to edit videos.
  class VideosController < ApplicationController
    before_action :require_account

    def index
      @back = manage_url
      @back_title = action_title(controller_path: 'manage/pages', action_name: 'index')
      @videos = []
    end
  end
end
