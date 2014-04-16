# encoding: utf-8

require_dependency "tigron/backstage/application_controller"

require "facter"

module Tigron
  module Backstage
    class SystemController < ApplicationController
      def index
        @facts = Facter.to_hash.to_a
      end
    end
  end
end

