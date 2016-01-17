# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'devtunnel/version'

Gem::Specification.new do |spec|
  spec.name          = "devtunnel"
  spec.version       = Devtunnel::VERSION
  spec.authors       = ["Bryan Thompson"]
  spec.email         = ["bryan@37chairs.com"]
  spec.description   = %q{Uses your DevTunnel account to quickly and easily tunnel a local dev port to the world.  Useful for pairing and sharing a local unicorn when behind a random NAT}
  spec.summary       = %q{How is this not the same as description?}
  spec.homepage      = "https://devtunnel.link"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| puts f; File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

	spec.add_dependency "commander"
	spec.add_dependency "rest-client"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
