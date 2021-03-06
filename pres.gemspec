$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "pres/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "pres"
  spec.version     = Pres::VERSION
  spec.authors     = ["Pres"]
  spec.email       = ["pres@pedia.one"]
  spec.homepage    = "https://github.com/PediaOne/Pres"
  spec.summary     = "Pres is a Rails plugin that allows one to push business logic events to an event stack."
  spec.description = "Pres is in development. More will be added later."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.2.4", ">= 5.2.4.1"
  spec.add_dependency('rest-client', '~> 2.1.0')
gem 'rest-client'

  spec.add_development_dependency "sqlite3"
end
