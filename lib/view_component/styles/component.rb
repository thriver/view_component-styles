# frozen_string_literal: true

module ViewComponent
  module Styles
    module Component
      include ViewComponent::Styles::Helper

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
