# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'RegexPermutator/version'

Gem::Specification.new do |spec|
  spec.name          = "regex-permutator"
  spec.version       = RegexPermutator::VERSION
  spec.authors       = ["Branden Giacoletto"]
  spec.email         = ["JockOfCode@gmail.com"]
  spec.summary       = %q{Renerates all permutations that match a simple regular expression}
  spec.description   = %q{Matching hashes with regex keys can take a long time, especially when there are a large quantitiy of regex keys being tested against. Creating all the possible matches for the hash key and then matching against those could potentially be faster, but does use more memory.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
end
