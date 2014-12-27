# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'splay_tree/version'

Gem::Specification.new do |spec|
  spec.name          = "splay_tree"
  spec.version       = SplayTree::VERSION
  spec.authors       = ["Piotr Murach"]
  spec.email         = [""]
  spec.summary       = %q{A self-balancing binary tree with amortized access.}
  spec.description   = %q{Self balancing binary tree that keeps lookup operations fast by optimizing frequently accessed keys. Useful for implementing caches and garbage collection algorithms.}
  spec.homepage      = "https://github.com/peter-murach/splay_tree"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
end
