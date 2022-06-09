# frozen_string_literal: true

module ViewComponent
  module Styles
    module Helper
      # @param path [String]
      # @return [Boolean]
      def asset_exists?(path)
        if Rails.configuration.assets.compile
          # Dynamic compilation
          Rails.application.assets.find_asset(path).present?
        else
          # Pre-compiled
          Rails.application.assets_manifest.assets[path].present?
        end
      end

      def singleton_stylesheet_link_tag(*args, **options)
        controller.singleton_stylesheets << stylesheet_link_tag(*args, **options) and return
      end

      def singleton_stylesheet_link_tags
        controller.singleton_stylesheets.select(&:html_safe?).join("\n").html_safe
      end
    end
  end
end
