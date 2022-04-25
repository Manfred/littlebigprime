# frozen_string_literal: true

# Allows users to see videos
class VideosController < ApplicationController
  before_action :require_password

  def index
    @videos = []
  end
end
