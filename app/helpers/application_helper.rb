# frozen_string_literal: true

module ApplicationHelper
  attr_accessor :page_title

  def icon_svg
    '<svg clip-rule="evenodd" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" viewBox="0 0 902.711 544.174" xmlns="http://www.w3.org/2000/svg"><g fill="#fff" fill-rule="evenodd"><path d="m1.78853 228.604c288.88347-391 833.33047-188.9203 896.75047-23.8l-49.094 17.887c-47.723-59.07-415.132-281.9-797.4346 20.482z"/><path d="m157.058 387.537c0-82.843 67.158-150 150-150 82.843 0 150 67.157 150 150s-67.157 150-150 150c-82.842 0-150-67.157-150-150z"/><path d="m653.397 450.07c0-11.046 8.955-20 20-20 11.046 0 20 8.954 20 20s-8.954 20-20 20c-11.045 0-20-8.954-20-20z"/></g></svg>'
  end

  def icon_back_svg
    '<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000"><path d="M0 0h24v24H0z" fill="none"/><path d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"/></svg>'
  end

  def icon_upload_svg
    '<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000"><path d="M0 0h24v24H0z" fill="none"/><path d="M9 16h6v-6h4l-7-7-7 7h4zm-4 2h14v2H5z"/></svg>'
  end
end
