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
  spec.files = ["lib/gvl_romance.rb", "lib/gvl_romance/cli.rb", "lib/gvl_romance/scraper.rb", "lib/gvl_romance/restaurant.rb", "lib/gvl_romance.rb"]
  spec.bindir        = "exe"
  spec.executables   << 'gvl_romance'
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
end
