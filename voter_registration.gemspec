$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "voter_registration/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "voter_registration"
  s.version     = VoterRegistration::VERSION
  s.authors     = ["The Democratic Party and Daniel Walmsley"]
  s.email       = ["dan@nationbuilder.com"]
  s.homepage    = "http://nationbuilder.com"
  s.summary     = "Register to vote in 2012"
  s.description = "Because together we can make democracy actually work"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "jquery-rails"
  s.add_dependency 'active_attr'
  s.add_dependency 'prawn'
  s.add_dependency 'prawn-fillform'
  s.add_dependency 'simple_form'
  s.add_dependency 'less-rails', '~> 2.2.3'
  s.add_dependency 'twitter-bootstrap-rails'
  s.add_dependency 'coffee-rails', '~> 3.2.1'
  s.add_development_dependency "sqlite3"
end
