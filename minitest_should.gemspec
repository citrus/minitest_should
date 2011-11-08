# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "minitest/should/version"

Gem::Specification.new do |s|
  s.name        = "minitest_should"
  s.version     = MiniTest::Should::VERSION
  s.authors     = ["Spencer Steffen"]
  s.email       = ["spencer@citrusme.com"]
  s.homepage    = "https://github.com/citrus/minitest_should"
  s.summary     = %q{Shoulda style syntax for minitest test::unit.}
  s.description = %q{Shoulda style syntax for minitest test::unit.}

  s.rubyforge_project = "minitest_should"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "minitest", "~> 2.7.0"
  s.add_development_dependency "rake",     "> 0"
  s.add_development_dependency "bundler",  "> 0"
  
end
