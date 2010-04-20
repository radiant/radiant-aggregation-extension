# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{radiant-aggregation-extension}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sean Cribbs", "Jim Gay"]
  s.date = %q{2010-04-20}
  s.description = %q{Provides tags to aggregate the children of multiple pages as well as page types
to create aggregated archives.}
  s.email = %q{radiant@radiantcms.org}
  s.extra_rdoc_files = [
    "LICENSE",
     "README"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README",
     "Rakefile",
     "VERSION",
     "aggregation_extension.rb",
     "app/models/aggregated_archive.rb",
     "app/models/aggregated_archive_day.rb",
     "app/models/aggregated_archive_month.rb",
     "app/models/aggregated_archive_year.rb",
     "lib/aggregation_tags.rb",
     "lib/radiant-aggregation-extension.rb",
     "lib/tasks/aggregation_extension_tasks.rake",
     "radiant-aggregation-extension.gemspec",
     "spec/models/aggregation_tags_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/radiant/radiant-aggregation-extension}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Aggregate the children of multiple pages.}
  s.test_files = [
    "spec/models/aggregation_tags_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end

