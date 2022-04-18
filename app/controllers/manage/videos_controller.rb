# frozen_string_literal: true

module Manage
  # Allows a content manager to edit videos.
  class VideosController < ApplicationController
    def index
      @videos = []
    end
  end
end
