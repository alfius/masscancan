$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mass_can_can/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mass_can_can"
  s.version     = MassCanCan::VERSION
  s.authors     = ["Alfonso Cora"]
  s.email       = ["acora6@gmail.com"]
  s.homepage    = "twitter.com/alfonsocora"
  s.summary     = "Use CanCan to define ActiveRecord mass assignment security"
  s.description = ""

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.3"
  #s.add_dependency "cancan", "~> 2.0.0" 

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
