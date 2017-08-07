# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_playing_cards/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_playing_cards"
  spec.version       = SimplePlayingCards::VERSION
  spec.authors       = ["Ken Jones"]

  spec.summary       = %q{Simple playing cards!}
  spec.description   = %q{A simple Gem for creating a deck of playing cards.}
  spec.homepage      = "https://github.com/k-p-jones/simple_playing_cards"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
