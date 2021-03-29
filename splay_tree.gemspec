# frozen_string_literal: true

require_relative "lib/splay_tree/version"

Gem::Specification.new do |spec|
  spec.name          = "splay_tree"
  spec.version       = SplayTree::VERSION
  spec.authors       = ["Piotr Murach"]
  spec.email         = ["piotr@piotrmurach.com"]
  spec.summary       = %q{A self-balancing binary tree with amortized access.}
  spec.description   = %q{Self balancing binary tree that keeps lookup operations fast by optimizing frequently accessed keys. Useful for implementing caches and garbage collection algorithms.}
  spec.homepage      = "https://github.com/piotrmurach/splay_tree"
  spec.license       = "MIT"
  if spec.respond_to?(:metadata)
    spec.metadata["bug_tracker_uri"] = "https://github.com/piotrmurach/splay_tree/issues"
    spec.metadata["changelog_uri"] = "https://github.com/piotrmurach/splay_tree/blob/master/CHANGELOG.md"
    spec.metadata["documentation_uri"] = "https://www.rubydoc.info/gems/splay_tree"
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/piotrmurach/splay_tree"
  end
  spec.files         = Dir["lib/**/*"]
  spec.extra_rdoc_files = ["README.md", "CHANGELOG.md", "LICENSE.txt"]
  spec.require_paths = ["lib"]
  spec.required_ruby_version = Gem::Requirement.new(">= 2.0.0")

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 3.0"
end
