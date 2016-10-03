# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'RiskalyzeAPI/version'

Gem::Specification.new do |spec|
  spec.name          = 'RiskalyzeAPI'
  spec.version       = RiskalyzeAPI::VERSION
  spec.authors       = ['Kevin Pheasey']
  spec.email         = ['kevin@kpheasey.com']

  spec.summary       = %q{Riskalyze API wrapper.}
  spec.description   = %q{Ruby wrapper for Riskalyze REST API}
  spec.homepage      = 'https://github.com/JoelBeasley/riskalyze_api'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
end
