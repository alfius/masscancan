$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mass_can_can/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mass_can_can"
  s.version     = MassCanCan::VERSION
  s.authors     = ["Alfonso Cora"]
  s.email       = ["acora6@gmail.com"]
  s.homepage    = "https://github.com/alfonsocora/masscancan"
  s.summary     = "Use CanCan to define ActiveRecord mass assignment security"
  s.description = "MassCanCan is an extension to the not-yet released CanCan 2.0. It grabs the permissions defined with CanCan and uses them to implement the ActiveRecord mass assignment security policies, removing the need to define the accessible attributes in the model and contributing to the application consistency."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "activesupport", "~> 3.0"
  s.add_dependency "activerecord", "~> 3.0"
  s.add_dependency "cancan", "~> 2.0" 

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
