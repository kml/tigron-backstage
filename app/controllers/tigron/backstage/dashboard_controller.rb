# encoding: utf-8

require_dependency "tigron/backstage/application_controller"

module Tigron
  module Backstage
    class DashboardController < ApplicationController
      def index
        @overview = overview
        @rails_info = Hash[Rails::Info.properties]

        @memory = OpenStruct.new({
          free_memory_mb: java.lang.Runtime.runtime.free_memory / 1024**2,
          max_memory_mb: java.lang.Runtime.runtime.max_memory / 1024**2,
          total_memory_mb: java.lang.Runtime.runtime.total_memory / 1024**2
        })
      end

      private

      def overview
        {
          "Application" => Tigron.application_name,
          "PID" => $$,
          "Hostname" => Socket.gethostname,
          "Backstage" => Backstage::VERSION,
          "Tigron" => Tigron::VERSION,
          "TorqueBox" => TorqueboxCore::VERSION,
          "Ruby" => RUBY_DESCRIPTION,
          "Puma" => "#{Puma::Const::VERSION} \"#{Puma::Const::CODE_NAME}\"",
          "HornetQ" => Tigron.messaging ? Tigron.messaging.version : nil,
          "Quartz" => Tigron.scheduler ? Tigron.scheduler.version : nil
        }
      end
    end
  end
end

