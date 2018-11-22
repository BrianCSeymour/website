# -*- encoding: utf-8 -*-
# stub: jekyll-font-awesome-sass 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "jekyll-font-awesome-sass".freeze
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["andrew morton".freeze]
  s.date = "2018-06-07"
  s.email = ["drewish@katherinehouse.com".freeze]
  s.homepage = "https://github.com/drewish/jekyll-font-awesome-sass".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.7".freeze
  s.summary = "A plugin to add Font Awesome to your Jekyll site.".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jekyll>.freeze, ["< 4.0", ">= 2.5"])
      s.add_runtime_dependency(%q<font-awesome-sass>.freeze, [">= 4"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.11"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.49.0"])
    else
      s.add_dependency(%q<jekyll>.freeze, ["< 4.0", ">= 2.5"])
      s.add_dependency(%q<font-awesome-sass>.freeze, [">= 4"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.11"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.49.0"])
    end
  else
    s.add_dependency(%q<jekyll>.freeze, ["< 4.0", ">= 2.5"])
    s.add_dependency(%q<font-awesome-sass>.freeze, [">= 4"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.11"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.49.0"])
  end
end
