# encoding: utf-8

require_dependency "tigron/backstage/application_controller"

module Tigron
  module Backstage
    class MessageProcessorsController < ApplicationController
      def index
        @message_processors = message_processors
        @workers = messaging_workers
      end

      private

      def message_processors
        Tigron.messaging ? Tigron.messaging.message_processors : []
      end

      def messaging_workers
        Tigron.messaging ? Tigron.messaging.workers : []
      end
    end
  end
end

