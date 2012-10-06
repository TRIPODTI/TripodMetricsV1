# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "axlsx_rails"
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Noel Peden"]
  s.date = "2012-07-25"
  s.description = "This plugin provides a Rails 3 renderer and template handler for xlsx using the axlsx gem."
  s.email = ["noel@peden.biz"]
  s.homepage = "https://github.com/straydogstudio/axlsx_rails"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.16"
  s.summary = "A simple rails plugin to provide an xlsx renderer using the axlsx gem."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 3.1"])
      s.add_runtime_dependency(%q<axlsx>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>, [">= 0"])
      s.add_development_dependency(%q<capybara>, [">= 0"])
      s.add_development_dependency(%q<acts_as_xlsx>, [">= 0"])
      s.add_development_dependency(%q<roo>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<growl>, [">= 0"])
    else
      s.add_dependency(%q<rails>, ["~> 3.1"])
      s.add_dependency(%q<axlsx>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, [">= 0"])
      s.add_dependency(%q<guard-rspec>, [">= 0"])
      s.add_dependency(%q<capybara>, [">= 0"])
      s.add_dependency(%q<acts_as_xlsx>, [">= 0"])
      s.add_dependency(%q<roo>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<growl>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.1"])
    s.add_dependency(%q<axlsx>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, [">= 0"])
    s.add_dependency(%q<guard-rspec>, [">= 0"])
    s.add_dependency(%q<capybara>, [">= 0"])
    s.add_dependency(%q<acts_as_xlsx>, [">= 0"])
    s.add_dependency(%q<roo>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<growl>, [">= 0"])
  end
end
