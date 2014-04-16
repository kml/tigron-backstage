# encoding: utf-8

require "bootstrap-sass"

module Tigron
  module Backstage
    class Engine < ::Rails::Engine
      isolate_namespace Backstage
    end
  end
end

