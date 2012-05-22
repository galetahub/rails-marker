# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "marker/version"

Gem::Specification.new do |s|
  s.name = "rails-marker"
  s.version = Marker::VERSION.dup
  s.platform = Gem::Platform::RUBY 
  s.summary = "Easy way to edit zoom, longitude and latitude"
  s.description = "Form helpers for edit fields such as zoom, longitude and latitude"
  s.authors = ["Igor Galeta", "Pavlo Galeta"]
  s.email = ["galeta.igor@gmail.com"]
  s.homepage = "https://github.com/galetahub/rails-marker"
  
  s.files = Dir["{app,lib,config,vendor}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["{spec}/**/*"]
  s.require_paths = ["lib"]
  
  s.add_development_dependency "sqlite3"
end
