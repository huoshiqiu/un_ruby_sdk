# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'un_ruby_sdk/version'

Gem::Specification.new do |spec|
  spec.name          = "un_ruby_sdk"
  spec.version       = UnRubySdk::VERSION
  spec.authors       = ["Jed_Huo"]
  spec.email         = ["huoshiqiu@gmail.com"]
  spec.summary       = %q{umeng notication ruby sdk}
  spec.description   = %q{umeng notication ruby sd}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  spec.add_dependency "rest-client", ">= 1.6.7"
end
