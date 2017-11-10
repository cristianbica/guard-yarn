# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "guard/yarn/version"

Gem::Specification.new do |spec|
  spec.name          = "guard-yarn"
  spec.version       = Guard::YarnVersion::VERSION
  spec.authors       = ["Cristian Bica"]
  spec.email         = ["cristian.bica@gmail.com"]

  spec.summary       = "Guard plugin for YARN"
  spec.description   = "Guard plugin for YARN. Run yarn whenever package.json changes"
  spec.homepage      = "https://github.com/cristianbica/guard-yarn"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "guard-compat", "~> 1.1"
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
end
