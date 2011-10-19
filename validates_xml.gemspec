# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{validates_xml}
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lukasz Piestrzeniewicz"]
  s.date = %q{2009-08-29}
  s.description = %q{Provides validates_xml method allowing to validate xml correctness of ActiveRecord attributes.}
  s.email = ["bragi@ragnarson.com"]
  s.extra_rdoc_files = ["README.textile"]
  s.files = %w(lib/validates_xml.rb rails/init.rb README.textile)
  s.has_rdoc = true
  s.homepage = %q{http://github.com/bragi/validates_xml}
  s.rdoc_options = ["--main", "README.textile"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{validates_xml}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Rails helper for validating xml attributes.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 2.0.0"])
    else
      s.add_dependency(%q<activerecord>, [">= 2.0.0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 2.0.0"])
  end
end
