# encoding: utf-8

require_dependency "tigron/backstage/application_controller"

module Tigron
  module Backstage
    class ServicesController < ApplicationController
      def index
        @services = TorqueBox::Service.list
      end
    end
  end
end

