# -*- encoding: utf-8 -*-
VERSION = "1.0"

Gem::Specification.new do |spec|
  spec.name          = "stringify_float"
  spec.version       = VERSION
  spec.authors       = ["Michael Graff"]
  spec.email         = ["explorer@flame.org"]
  spec.description   = %q{Work around poor floating point support with RubyMotion and Core Data}
  spec.summary       = %q{Work around poor floating point support in RubyMotion + Core Data}
  spec.homepage      = "https://github.com/skandragon/stringify_float"
  spec.license       = "MIT"

  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*.rb'))
  spec.files         = files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
end
