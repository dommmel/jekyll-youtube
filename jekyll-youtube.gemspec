# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll-youtube/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-youtube"
  spec.version       = Jekyll::Youtube::VERSION
  spec.authors       = ["Dommmel"]
  spec.email         = ["dommmel@gmail.com"]

  spec.summary       = %q{jekyll plugin to generate html snippets for embedding Youtube videos}
  spec.description   = %q{jekyll plugin to generate html snippets for embedding Youtube videos}
  spec.homepage      = "https://github.com/dommmel/jekyll-youtube"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'jekyll'
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
