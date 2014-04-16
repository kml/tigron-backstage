# encoding: utf-8

require_dependency "tigron/backstage/application_controller"

module Tigron
  module Backstage
    class JobsController < ApplicationController
      def index
        if Tigron.scheduler
          @jobs = Tigron.scheduler.list
          @meta_data = Tigron.scheduler.meta_data
        else
          @jobs = []
          @meta_data = {}
        end
      end
    end
  end
end

