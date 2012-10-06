# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "to_xls"
  s.version = "1.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Enrique Garcia Cota", "Francisco de Juan", "Sergio D\u{c3}\u{ad}az \u{c3}\u{81}lvarez"]
  s.date = "2012-06-08"
  s.description = "Adds a to_xls method to all enumerations, which can be used to generate excel files conveniently. Can rely on ActiveRecord sugar for obtaining attribute names."
  s.email = "egarcia@splendeo.es"
  s.homepage = "https://github.com/splendeo/to_xls"
  s.require_paths = ["lib"]
  s.rubyforge_project = "to_xls"
  s.rubygems_version = "1.8.16"
  s.summary = "to_xls for Enumerations"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<spreadsheet>, [">= 0"])
      s.add_development_dependency(%q<spreadsheet>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.1.0"])
      s.add_development_dependency(%q<rake>, ["~> 0.9.2"])
    else
      s.add_dependency(%q<spreadsheet>, [">= 0"])
      s.add_dependency(%q<spreadsheet>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_dependency(%q<bundler>, ["~> 1.1.0"])
      s.add_dependency(%q<rake>, ["~> 0.9.2"])
    end
  else
    s.add_dependency(%q<spreadsheet>, [">= 0"])
    s.add_dependency(%q<spreadsheet>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.3.0"])
    s.add_dependency(%q<bundler>, ["~> 1.1.0"])
    s.add_dependency(%q<rake>, ["~> 0.9.2"])
  end
end
