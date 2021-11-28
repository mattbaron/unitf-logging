# frozen_string_literal: true

require_relative "lib/unitf/logging/version"

Gem::Specification.new do |spec|
  spec.name          = "unitf-logging"
  spec.version       = Unitf::Logging::VERSION
  spec.authors       = ["Matt Baron"]
  spec.email         = ["mwb@unitf.net"]

  spec.summary       = "Logging"
  spec.description   = spec.summary
  spec.homepage      = "https://www.github.com/mattbaron/unitf-logging"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = 'https://rubygems.org'

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://www.github.com/mattbaron/unitf-logging"
  spec.metadata["changelog_uri"] = "https://www.github.com/mattbaron/unitf-logging/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
