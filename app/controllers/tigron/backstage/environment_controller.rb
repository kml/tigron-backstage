# encoding: utf-8

require_dependency "tigron/backstage/application_controller"

require "java"

module Tigron
  module Backstage
    class EnvironmentController < ApplicationController
      def index
        @env = ENV.to_a
        @properties = java.lang.System.properties.property_names.map do |name|
          [name, java.lang.System.get_property(name)]
        end
        @input_arguments = java.lang.management.ManagementFactory.getRuntimeMXBean().input_arguments.to_a
        @ruby = RbConfig::CONFIG.to_a

        # http://rubygems.rubyforge.org/rubygems-update/Gem/Specification.html
        @gems = Gem::Specification.map do |gem|
          [gem.homepage.blank? ? gem.name : "<a href=\"#{gem.homepage}\">#{gem.name}</a>", gem.version.to_s, gem.summary]
        end

        #@symbols = Symbol.all_symbols.map(&:inspect)
        @symbols_count = Symbol.all_symbols.count

        # Modular Service Container
        # http://docs.jboss.org/osgi/jboss-osgi-1.0.0/apidocs/org/jboss/msc/service/ServiceController.html
        # TB 2.x does not respond to get_services
        @msc_services = TorqueBox::MSC.respond_to?(:get_services) ? TorqueBox::MSC.get_services(//) : []
      end

      private

      def java_version
        "%s (build %s); %s (build %s, %s)" % [
          java.lang.System.getProperty("java.version"),
          java.lang.System.getProperty("java.runtime.version"),
          java.lang.System.getProperty("java.vm.name"),
          java.lang.System.getProperty("java.vm.version"),
          java.lang.System.getProperty("java.vm.info")
        ]
      end
    end
  end
end

