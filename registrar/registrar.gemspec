$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "registrar/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "registrar"
  s.version     = '0.0.0'
  s.authors     = ["Jessica Yao", "Lakshmi Parthasarathy"]
  s.email       = ["jy.jyao@gmail.com", "lakshmi122290@gmail.com"]
  s.homepage    = "http://www.jyao.wow"
  s.summary     = "Registrar"
  s.description = "A gem to setup a basic user management system for Rails apps."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.2"

  s.add_development_dependency "sqlite3"
end
