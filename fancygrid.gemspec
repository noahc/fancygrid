# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fancygrid}
  s.version = "0.3.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alexander Gr\303\244fenstein"]
  s.date = %q{2010-11-26}
  s.description = %q{Enables easy tablerendering in rails applications}
  s.email = %q{giniedp@online.de}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.md"
  ]
  s.files = [
    ".bundle/config",
     ".gitignore",
     "CHANGELOG",
     "Gemfile",
     "Gemfile.lock",
     "LICENSE",
     "README.md",
     "ROADMAP",
     "Rakefile",
     "VERSION",
     "app/views/fancygrid/_cells.html.haml",
     "app/views/fancygrid/base/controls.html.haml",
     "app/views/fancygrid/base/list_frame.html.haml",
     "app/views/fancygrid/base/table_frame.html.haml",
     "config/initializers/fancygrid.rb",
     "config/locales/fancygrid.de.yml",
     "config/locales/fancygrid.en.yml",
     "fancygrid.gemspec",
     "init.rb",
     "lib/fancygrid.rb",
     "lib/fancygrid/grid.rb",
     "lib/fancygrid/helper.rb",
     "lib/fancygrid/node.rb",
     "lib/generators/install_generator.rb",
     "lib/generators/scss_generator.rb",
     "lib/generators/views_generator.rb",
     "lib/version.rb",
     "public/images/fancygrid/add.png",
     "public/images/fancygrid/clear.png",
     "public/images/fancygrid/ddn.png",
     "public/images/fancygrid/dn.png",
     "public/images/fancygrid/first.png",
     "public/images/fancygrid/last.png",
     "public/images/fancygrid/loading.gif",
     "public/images/fancygrid/magnifier.png",
     "public/images/fancygrid/next.png",
     "public/images/fancygrid/prev.png",
     "public/images/fancygrid/reload.png",
     "public/images/fancygrid/spacer.gif",
     "public/images/fancygrid/th_bg.png",
     "public/images/fancygrid/up.png",
     "public/images/fancygrid/uup.png",
     "public/javascripts/fancygrid.js",
     "public/stylesheets/_fancygrid.scss",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/giniedp/fancygrid}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Table rendering for rails applications}
  s.test_files = [
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

