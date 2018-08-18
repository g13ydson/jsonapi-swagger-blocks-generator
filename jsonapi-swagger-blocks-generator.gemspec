
# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jsonapi/swagger/blocks/generator/version"

Gem::Specification.new do |spec|
  spec.name          = "jsonapi-swagger-blocks-generator"
  spec.version       = Jsonapi::Swagger::Blocks::Generator::VERSION
  spec.authors       = ["Gleydson Tavares"]
  spec.email         = ["tavares.gleydson@gmail.com"]

  spec.summary       = "creates swagger-blocks gem files using jsonapi specification"
  spec.description   = "The swagger-bloks files are created based on the JSONAPI::Resources files. To use this gem, you need to have jsonapi-resources gem installed."
  spec.homepage      = "https://github.com/g13ydson/jsonapi-swagger-blocks"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
