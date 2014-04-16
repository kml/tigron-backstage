# encoding: utf-8

$:.push File.expand_path("../lib", __FILE__)

require "tigron/backstage/version"

Gem::Specification.new do |s|
  s.name        = "tigron-backstage"
  s.version     = Tigron::Backstage::VERSION
  s.authors     = ["Kamil Lemański"]
  s.email       = ["kamil.lemanski@gmail.com"]
  s.homepage    = ""
  s.summary     = ""
  s.description = ""

  s.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "tigron"

  s.add_dependency "rails", "~> 3.2.9"
  s.add_dependency "jquery-rails"
  s.add_dependency "rack-webconsole"
  s.add_dependency "sass-rails"
  s.add_dependency "bootstrap-sass", '2.3.2.0'
  s.add_dependency "facter"
  s.add_dependency "CFPropertyList", "2.2.6"
end

