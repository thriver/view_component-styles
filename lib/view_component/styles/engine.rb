# frozen_string_literal: true

module ViewComponent
  module Styles
    class Engine < Rails::Engine
      config.assets.paths << Rails.root.join('app', 'components')
    end
  end
end
