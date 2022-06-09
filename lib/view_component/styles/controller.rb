# frozen_string_literal: true

module ViewComponent
  module Styles
    module Controller
      include Helper

      def singleton_stylesheets
        @singleton_stylesheets ||= Set.new
      end
    end
  end
end
