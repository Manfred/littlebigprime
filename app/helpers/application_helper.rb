# frozen_string_literal: true

module ApplicationHelper
  def page_title
    @page_title || t('.page_title')
  end

  def icon_svg
    '<svg xmlns="http://www.w3.org/2000/svg" stroke-miterlimit="10" viewBox="0 0 902.711 544.174" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round" fill="#fff" xmlns:v="https://vecta.io/nano"><path d="M1.789 228.604c288.883-391 833.33-188.92 896.75-23.8l-49.094 17.887c-47.723-59.07-415.132-281.9-797.435 20.482L1.789 228.604zm290.315 9.403h21.633c76.869 0 139.183 62.315 139.183 139.183v21.634c0 76.869-62.314 139.183-139.183 139.183h-21.633c-76.869 0-139.184-62.314-139.184-139.183V377.19c0-76.868 62.315-139.183 139.184-139.183zm380.728 191.375h2.76c11.046 0 20 8.955 20 20h0c0 11.046-8.954 20-20 20h-2.76c-11.045 0-20-8.954-20-20h0c0-11.045 8.955-20 20-20z"/></svg>'
  end
end
