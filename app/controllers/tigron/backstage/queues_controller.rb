# encoding: utf-8

require_dependency "tigron/backstage/application_controller"

module Tigron
  module Backstage
    class QueuesController < ApplicationController
      def index
        @queues = queues
      end

      def show
        queue_name = Base64.decode64(params[:id])
        @queue = Tigron.messaging.find(queue_name)
      end

      private

      def queues
        Tigron.messaging ? Tigron.messaging.list : []
      end
    end
  end
end

