# encoding: utf-8

require_dependency "tigron/backstage/application_controller"

module Tigron
  module Backstage
    class ThreadsController < ApplicationController
      def show
        thread = Thread.list.find { |thread| thread.object_id == params[:id].to_i }
        native_thread = JRuby.reference(thread).native_thread if thread

        @backtrace = thread.backtrace.join("\n") if thread

        @native_backtrace = native_thread.getStackTrace.map do |tigron_trace_element|
          # http://docs.oracle.com/javase/1.5.0/docs/api/java/lang/StackTraceElement.html
          tigron_trace_element.to_string
        end.join("\n") if native_thread
      end
    end
  end
end

