# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nutcase/version'

Gem::Specification.new do |spec|
  spec.name          = "nutcase"
  spec.version       = Nutcase::VERSION
  spec.authors       = ["Thomas Hanson"]
  spec.email         = ["thomas@diresquirrel.com"]
  spec.summary       = %q{a generic interface to ruby servers for dev}
  spec.description   = %q{allows you to run nutcase as an interface to your ruby server of choice (thin, unicorn, puma, etc.)}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rerun"
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.4"
end
