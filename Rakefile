#!/usr/bin/env ruby

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
