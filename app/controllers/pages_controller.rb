# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @password = AuthenticatedSession::Create.new(verify: :password)
  end
end
