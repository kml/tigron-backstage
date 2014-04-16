# encoding: utf-8

module Tigron
  module Backstage
    class ProcessMonitoring
      RLIMITS = {
        PRIO_PGRP: nil,
        PRIO_PROCESS: nil,
        PRIO_USER: nil,
        RLIMIT_AS: "Maximum size of the process’s virtual memory (address space) in bytes.",
        RLIMIT_CORE: "Maximum size of the core file.",
        RLIMIT_CPU: "CPU time limit in seconds.",
        RLIMIT_DATA: "Maximum size of the process’s data segment.",
        RLIMIT_FSIZE: "Maximum size of files that the process may create.",
        RLIMIT_MEMLOCK: "Maximum number of bytes of memory that may be locked into RAM.",
        RLIMIT_MSGQUEUE: "Specifies the limit on the number of bytes that can be allocated for POSIX message queues for the real user ID of the calling process.",
        RLIMIT_NICE: "Specifies a ceiling to which the process’s nice value can be raised.",
        RLIMIT_NOFILE: "Specifies a value one greater than the maximum file descriptor number that can be opened by this process.",
        RLIMIT_NPROC: "The maximum number of processes that can be created for the real user ID of the calling process.",
        RLIMIT_RSS: "Specifies the limit (in pages) of the process’s resident set.",
        RLIMIT_RTPRIO: "Specifies a ceiling on the real-time priority that may be set for this process.",
        RLIMIT_RTTIME: "Specifies limit on CPU time this process scheduled under a real-time scheduling policy can consume.",
        RLIMIT_SBSIZE: "Maximum size of the socket buffer.",
        RLIMIT_SIGPENDING: "Specifies a limit on the number of signals that may be queued for the real user ID of the calling process.",
        RLIMIT_STACK: "Maximum size of the tigron, in bytes.",
        RLIM_INFINITY: nil,
        RLIM_SAVED_CUR: nil,
        RLIM_SAVED_MAX: nil,
        WNOHANG: nil,
        WUNTRACED: nil
      }

      def all
        {
          "pid" => Process.pid,
          "egid" => Process.egid,
          "euid" => Process.euid,
          "process group ID" => Process.getpgrp,
          "gid" => Process.gid,
          "uid" => Process.uid,
          "ppid" => Process.ppid,
          #"groups" => Process.groups,
          #"maxgroups" => Process.maxgroups,
          "times" => {
              "utime" => Process.times.utime,
              "stime" => Process.times.stime,
              "cutime" => Process.times.cutime,
              "cstime" => Process.times.cstime
          },
          "priority" => {
            "prio_pgrp" => Process.getpriority(Process::PRIO_PGRP, 0),
            "prio_user" => Process.getpriority(Process::PRIO_USER, 0),
            "prio_process" => Process.getpriority(Process::PRIO_PROCESS, 0)
          },
          # "rlimit" => Hash[%w[CORE CPU DATA FSIZE NOFILE STACK AS MEMLOCK NPROC RSS SBSIZE].map do |resource|
          #   value = Process.getrlimit(resource) rescue nil
          #   [resource, value]
          # end],
        }
      end

      def rlimits
        RLIMITS.each_with_object({}) do |(name, description), object|
          object[name] = begin
            Process.const_get(name)
          rescue NameError => ex
            nil
          end
        end
      end
    end
  end
end

