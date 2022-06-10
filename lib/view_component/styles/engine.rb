# frozen_string_literal: true

module ViewComponent
  module Styles
    class Engine < Rails::Engine
      initializer 'view_component-styles.assets.paths' do |app|
        config.assets.paths << app.root.join('app', 'components')
      end
    end
  end
end
