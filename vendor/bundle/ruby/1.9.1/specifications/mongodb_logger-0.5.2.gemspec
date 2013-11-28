# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "mongodb_logger"
  s.version = "0.5.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alexey Vasiliev"]
  s.date = "2013-04-16"
  s.description = "MongoDB logger for Rails"
  s.email = ["leopard.not.a@gmail.com"]
  s.executables = ["mongodb_logger_web"]
  s.extra_rdoc_files = ["LICENSE", "README.md"]
  s.files = ["bin/mongodb_logger_web", "LICENSE", "README.md"]
  s.homepage = "http://mongodb-logger.catware.org"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "mongodb_logger"
  s.rubygems_version = "1.8.23"
  s.summary = "MongoDB logger for Rails"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
      s.add_development_dependency(%q<cucumber-rails>, [">= 0"])
      s.add_development_dependency(%q<capybara>, ["= 2.0.3"])
      s.add_development_dependency(%q<coffee-script>, [">= 0"])
      s.add_development_dependency(%q<uglifier>, [">= 0"])
      s.add_development_dependency(%q<jasmine>, [">= 0"])
      s.add_development_dependency(%q<appraisal>, [">= 0"])
      s.add_development_dependency(%q<aruba>, [">= 0"])
      s.add_development_dependency(%q<mongo>, [">= 0"])
      s.add_development_dependency(%q<moped>, [">= 0"])
      s.add_runtime_dependency(%q<rake>, [">= 0.9.0"])
      s.add_runtime_dependency(%q<multi_json>, [">= 1.6.0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 3.1.0"])
      s.add_runtime_dependency(%q<actionpack>, [">= 3.1.0"])
      s.add_runtime_dependency(%q<sprockets>, [">= 2.0.0"])
      s.add_runtime_dependency(%q<sinatra>, [">= 1.3.0"])
      s.add_runtime_dependency(%q<erubis>, [">= 2.7.0"])
      s.add_runtime_dependency(%q<mustache>, [">= 0.99.0"])
      s.add_runtime_dependency(%q<vegas>, ["~> 0.1.0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
      s.add_dependency(%q<cucumber-rails>, [">= 0"])
      s.add_dependency(%q<capybara>, ["= 2.0.3"])
      s.add_dependency(%q<coffee-script>, [">= 0"])
      s.add_dependency(%q<uglifier>, [">= 0"])
      s.add_dependency(%q<jasmine>, [">= 0"])
      s.add_dependency(%q<appraisal>, [">= 0"])
      s.add_dependency(%q<aruba>, [">= 0"])
      s.add_dependency(%q<mongo>, [">= 0"])
      s.add_dependency(%q<moped>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0.9.0"])
      s.add_dependency(%q<multi_json>, [">= 1.6.0"])
      s.add_dependency(%q<activesupport>, [">= 3.1.0"])
      s.add_dependency(%q<actionpack>, [">= 3.1.0"])
      s.add_dependency(%q<sprockets>, [">= 2.0.0"])
      s.add_dependency(%q<sinatra>, [">= 1.3.0"])
      s.add_dependency(%q<erubis>, [">= 2.7.0"])
      s.add_dependency(%q<mustache>, [">= 0.99.0"])
      s.add_dependency(%q<vegas>, ["~> 0.1.0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
    s.add_dependency(%q<cucumber-rails>, [">= 0"])
    s.add_dependency(%q<capybara>, ["= 2.0.3"])
    s.add_dependency(%q<coffee-script>, [">= 0"])
    s.add_dependency(%q<uglifier>, [">= 0"])
    s.add_dependency(%q<jasmine>, [">= 0"])
    s.add_dependency(%q<appraisal>, [">= 0"])
    s.add_dependency(%q<aruba>, [">= 0"])
    s.add_dependency(%q<mongo>, [">= 0"])
    s.add_dependency(%q<moped>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0.9.0"])
    s.add_dependency(%q<multi_json>, [">= 1.6.0"])
    s.add_dependency(%q<activesupport>, [">= 3.1.0"])
    s.add_dependency(%q<actionpack>, [">= 3.1.0"])
    s.add_dependency(%q<sprockets>, [">= 2.0.0"])
    s.add_dependency(%q<sinatra>, [">= 1.3.0"])
    s.add_dependency(%q<erubis>, [">= 2.7.0"])
    s.add_dependency(%q<mustache>, [">= 0.99.0"])
    s.add_dependency(%q<vegas>, ["~> 0.1.0"])
  end
end
