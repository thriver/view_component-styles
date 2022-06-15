# frozen_string_literal: true

module ViewComponent
  module Styles
    module Component
      def asset_exists?(path)
        if Rails.configuration.assets.compile
          # Dynamic compilation
          Rails.application.assets.find_asset(path).present?
        else
          # Pre-compiled
          Rails.application.assets_manifest.assets[path].present?
        end
      end

      def component_stylesheet_name
        "#{name.underscore}.css"
      end

      def inherited(subclass)
        super
        subclass.include(ViewComponent::Styles::Helper)

        component_stylesheet_name = subclass.component_stylesheet_name
        return unless asset_exists?(component_stylesheet_name)

        subclass.prepend(Module.new.tap do |m|
          m.class_eval(<<-RUBY, __FILE__, __LINE__ + 1)
            # def before_render
            #   super
            #   singleton_stylesheet_link_tag("example")
            # end
            def before_render
              super
              singleton_stylesheet_link_tag(#{component_stylesheet_name.inspect})
            end
          RUBY
        end)
      end
    end
  end
end
