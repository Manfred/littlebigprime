# frozen_string_literal: true

module ApplicationHelper
  def page_title
    @page_title || t('.page_title')
  end
end
