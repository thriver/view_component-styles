# frozen_string_literal: true

module ViewComponent
  module Styles
    module Component
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

      # @return [void]
      def before_render
        singleton_stylesheet_link_tag(component_stylesheet_name) if asset_exists?(component_stylesheet_name)
      end

      # @return [String]
      def component_stylesheet_name
        "#{self.class.name.underscore}.css"
      end
    end
  end
end
