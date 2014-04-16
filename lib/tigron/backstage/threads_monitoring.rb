# encoding: utf-8

require "java"

module Tigron
  module Backstage
    class ThreadsMonitoring
      def all
        Thread.list.sort {|t1, t2| t1.object_id <=> t2.object_id }.map do |thread|
          native_thread = JRuby.reference(thread).native_thread

          OpenStruct.new({
            id: thread.object_id,
            status: thread.status,
            is_alive: thread.alive?,
            # CachingCallSite.java:418:in `pollAndGetClass': java.lang.NullPointerException
            #column thread.priority.inspect
            #column thread.group
            # NotImplementedError: Thread-specific SAFE levels are not supported
            #column thread.safe_level
            abort_on_exception: thread.abort_on_exception,
            is_current: thread == Thread.current,
            is_main: thread == Thread.main,
            native_id: native_thread.id,
            name: native_thread.name,
            is_daemon: native_thread.daemon?,
            prority: native_thread.priority
          })
        end
      end
    end
  end
end

