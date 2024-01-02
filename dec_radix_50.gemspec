# frozen_string_literal: true

require_relative "lib/dec_radix_50/version"

Gem::Specification.new do |spec|
  spec.name = "dec_radix_50"
  spec.version = DECRadix50::VERSION
  spec.authors = ["8bit-m8"]
  spec.email = ["you@example.com"]

  spec.summary = "DEC RADIX 50 encoding."
  spec.homepage = "https://github.com/8bit-mate/dec_radix_50.rb"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
