# encoding: utf-8

require_dependency "tigron/backstage/application_controller"

module Tigron
  module Backstage
    class ServerController < ApplicationController
      def index
        @server = Tigron.lookup("web")
      end
    end
  end
end

