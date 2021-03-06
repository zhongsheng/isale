$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "isale/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "isale"
  spec.version     = Isale::VERSION
  spec.authors     = ["zhongsheng"]
  spec.email       = ["nily.zhong@gmail.com"]
  spec.homepage    = "http://mythlife.cc"
  spec.summary     = "Summary of Isale."
  spec.description = "Description of Isale."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "http://mygemserver.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.0.beta3"
  spec.add_dependency "redis"
  spec.add_dependency "redis-namespace"
  spec.add_dependency "jwt"

  spec.add_development_dependency "sqlite3"
end
