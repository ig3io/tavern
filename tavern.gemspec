# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tavern/version'

Gem::Specification.new do |spec|
  spec.name          = "tavern"
  spec.version       = Tavern::VERSION
  spec.authors       = ["Ignacio Contreras Pinilla"]
  spec.email         = ["ignacio@ignacio.cat"]
  spec.description   = %q{Simple to-do gem and command line application}
  spec.summary       = %q{Post tasks, complete them, log work, and so on...}
  spec.homepage      = "http://github.com/ignaciocontreras/tavern"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
