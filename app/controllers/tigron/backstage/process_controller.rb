# encoding: utf-8

require_dependency "tigron/backstage/application_controller"

require "tigron/backstage/process_monitoring"
require "tigron/backstage/threads_monitoring"

module Tigron
  module Backstage
    class ProcessController < ApplicationController
      def index
        @process = Tigron::Backstage::ProcessMonitoring.new.all
        @rlimits = Tigron::Backstage::ProcessMonitoring.new.rlimits
        @threads = Tigron::Backstage::ThreadsMonitoring.new.all
        @threads_count = Thread.list.count
      end
    end
  end
end

