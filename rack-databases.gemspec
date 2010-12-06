# -*- encoding: utf-8 -*-
require File.expand_path("../lib/rack-databases/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "rack-databases"
  s.version     = Rack::Databases::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Burke Libbey"]
  s.email       = ["burke@burkelibbey.org"]
  s.homepage    = "http://rubygems.org/gems/rack-databases"
  s.summary     = "Rack Middleware to easily switch databases in development"
  s.description = "Rack Middleware to easily switch databases in development"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "rack-databases"

  s.add_development_dependency "bundler", ">= 1.0.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
