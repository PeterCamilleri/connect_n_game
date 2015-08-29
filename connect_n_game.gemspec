# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'connect_n_game/version'

Gem::Specification.new do |spec|
  spec.name          = "connect_n_game"
  spec.version       = ConnectNGame::VERSION
  spec.authors       = ["Peter Camilleri"]
  spec.email         = ["peter.c.camilleri@gmail.com"]
  spec.summary       = "The Connect 4 (or more) Game gem."
  spec.description   = "The Captain's Mistress Game Generalized for 4 to 8 pieces."
  spec.homepage      = "http://teuthida-technologies.com/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'reek', "~> 1.3.8"
  spec.add_development_dependency 'minitest', "~> 5.5.1"
  spec.add_development_dependency 'minitest_visible', "~> 0.0.1"
  spec.add_development_dependency 'rdoc', "~> 4.0.1"

end
