lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gvl_romance/version"

Gem::Specification.new do |spec|
  spec.name          = "gvl_romance"
  spec.version       = GvlRomance::VERSION
  spec.authors       = ["miquitruli"]
  spec.email         = ["micaelc@g.clemson.edu"]

  spec.summary       = "Top 10 romantic restaurants in Greenville, SC"
  spec.description   = "Allows user to pick restaurant based on location and gives them expert tips plus information about restaurant"
  spec.homepage      = "https://github.com/miquitruli/gvl_romance"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/miquitruli/gvl_romance"
  spec.metadata["changelog_uri"] = "https://github.com/miquitruli/gvl_romance/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
end
