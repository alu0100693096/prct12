# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prct09/version'

Gem::Specification.new do |spec|
  spec.name          = "prct09"
  spec.version       = Prct09::VERSION
  spec.authors       = ["Laura Fariña", "Sergio Afonso"]
  spec.email         = ["alu0100693096@ull.edu.es", "alu0100700459@ull.edu.es"]
  spec.description   = %q{Clases que permiten gestionar matrices densas o dispersas de forma diferente para mejorar el uso de la memoria.}
  spec.summary       = %q{Conjunto de clases para la gestión de matrices dispersas o densas.}
  spec.homepage      = "https://github.com/alu0100693096/prct09"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"
end
