# frozen_string_literal: true

require_relative "lib/pushover2/version"

Gem::Specification.new do |spec|
  spec.name = "pushover2"
  spec.version = Pushover2::VERSION
  spec.authors = ["Ihor Zubkov"]
  spec.email = ["igor.zubkov@gmail.com"]

  spec.summary = "Ruby API for pushover.net"
  spec.description = "Ruby API for pushover.net."
  spec.homepage = "https://github.com/biow0lf/pushover2"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.4.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/biow0lf/pushover2"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore .rspec spec/ .github/ .standard.yml])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "json"
  spec.add_dependency "uri"
  spec.add_dependency "net-http"

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
end
