# frozen_string_literal: true

module Manage
  # Allows a content manager to edit videos.
  class VideosController < ApplicationController
    before_action :require_account

    def index
      @videos = []
    end
  end
end
