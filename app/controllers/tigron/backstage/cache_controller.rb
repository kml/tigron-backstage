# encoding: utf-8

require_dependency "tigron/backstage/application_controller"

module Tigron
  module Backstage
    class CacheController < ApplicationController
      def index
        @info = Tigron.lookup("cache")
      end
    end
  end
end

