#!/usr/bin/env ruby

begin
  require 'rubygems'
  require 'rake/gempackagetask'
rescue Exception
  nil
end
require 'rake/testtask'

task :default => :test

Rake::TestTask.new do |t|
  t.test_files = FileList[
    '*_test.rb',
    'test/*_test.rb',
    'test/**/*_test.rb',
  ]
  t.verbose = false
end

# ====================================================================
# Create a task that will package the Rake software into distributable
# tar, zip and gem files.

$package_version = '1.0.0'
PKG_FILES = FileList[
  '[A-Z]*',
  'lib/**/*.rb', 
  'test/**/*.rb'
]

if ! defined?(Gem)
  puts "Package Target requires RubyGEMs"
else
  SPEC = Gem::Specification.new do |s|
    s.name = 'rava'
    s.version = $package_version
    s.summary = "Ruby for Java Programmers."
    s.description = <<-EOF
    Rava is a utility library designed to make entry into the
    Ruby world a little easier.
    EOF
    s.files = PKG_FILES.to_a
    s.require_path = 'lib'                         # Use these for libraries.
    s.has_rdoc = true
    s.extra_rdoc_files = []
    s.rdoc_options = ""
    s.author = "Jim Weirich"
    s.email = "jim@weirichhouse.org"
    s.homepage = "http://github.com/jimweirich/rava"
#    s.rubyforge_project = "rake"
  end

  package_task = Rake::GemPackageTask.new(SPEC) do |pkg|
    pkg.need_zip = true
    pkg.need_tar = true
  end

  file "rava.gemspec" => ["Rakefile"] + FileList["lib/**/*.rb"] do |t|
    require 'yaml'
    open(t.name, "w") { |f| f.puts SPEC.to_yaml }
  end

  desc "Create a stand-alone gemspec"
  task :gemspec => "rava.gemspec"
end
