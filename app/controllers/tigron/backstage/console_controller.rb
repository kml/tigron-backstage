# encoding: utf-8

require_dependency "tigron/backstage/application_controller"

module Tigron
  module Backstage
    class ConsoleController < ApplicationController
      def index
        @html_code = assets_manager.html_code
        @css_code = assets_manager.style_code
        @js_code = assets_manager.javascript_code({"SCRIPT_NAME" => request.env["SCRIPT_NAME"]})
      end

      private

      def assets_manager
        Rack::Webconsole::AssetsManager.new
      end
    end
  end
end

