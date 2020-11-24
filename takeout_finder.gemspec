
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "takeout_finder/version"

Gem::Specification.new do |spec|
  spec.name          = "takeout_finder"
  spec.version       = TakeoutFinder::VERSION
  spec.authors       = ["'Jessica Rohrer'"]
  spec.email         = ["'jessie.rohrer@gmail.com'"]

  spec.summary       = %q{Finds local takeout.}
  spec.description   = %q{Get a list of local restaurants by category to help you decide where to eat tonight.}
  spec.homepage      = "https://github.com/jrrohrer/takeout_finder"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/jrrohrer/takeout_finder"
    spec.metadata["changelog_uri"] = "https://github.com/jrrohrer/takeout_finder"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "debase"
  spec.add_development_dependency "ruby-debug-ide"
  spec.add_development_dependency "readapt"
  spec.add_dependency "nokogiri"
  spec.add_dependency "colorize", "~> 0.7.7"
end
