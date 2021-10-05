# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "rblocks"
  spec.version       = "1.0.0"
  spec.authors       = ["Armin Pasalic"]
  spec.email         = ["armin@pasalic.me"]

  spec.summary       = "Ruby Blocks"
  spec.description   = "Ruby implementation of some basic building blocks."
  spec.homepage      = "https://github.com/krule/rblocks"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/krule/rblocks"
  spec.metadata["changelog_uri"] = "https://github.com/krule/rblocks/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rubocop", "~> 1.7"
  spec.add_development_dependency "rubocop-minitest", "~> 0.15"
  spec.add_development_dependency "rubocop-rake", "~> 0.6"
end
