# frozen_string_literal: true

module ViewComponent
  module Styles
    module Helper
      def singleton_stylesheet_link_tag(*args, **options)
        controller.singleton_stylesheets << stylesheet_link_tag(*args, **options) and return
      end

      def singleton_stylesheet_link_tags
        controller.singleton_stylesheets.select(&:html_safe?).join("\n").html_safe
      end
    end
  end
end
