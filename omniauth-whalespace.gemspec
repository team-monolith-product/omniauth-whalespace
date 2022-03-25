# frozen_string_literal: true

require_relative "lib/omniauth/whalespace/version"

Gem::Specification.new do |spec|
  spec.name = "omniauth-whalespace"
  spec.version = Omniauth::Whalespace::VERSION
  spec.authors = ["이창환"]
  spec.email = ["lch@team-mono.com"]

  spec.summary = "Whalespace OAuth2 Strategy for OmniAuth"
  spec.homepage = "https://github.com/team-monolith-product/omniauth-whalespace"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "omniauth-oauth2", "~> 1.2"
end
