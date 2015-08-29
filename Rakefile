#!/usr/bin/env rake

require 'rake/testtask'
require 'rdoc/task'

require "bundler/gem_tasks"

#Generate internal documentation with rdoc.
RDoc::Task.new do |rdoc|
  rdoc.rdoc_dir = "rdoc"

  #List out all the files to be documented.
  rdoc.rdoc_files.include("lib/**/*.rb", "license.txt", "README.md")

  #Make all access levels visible.
  rdoc.options << '--visibility' << 'private'
  #rdoc.options << '--verbose'
  #rdoc.options << '--coverage-report'

  #Set a title.
  rdoc.options << '--title' << 'fOOrth Language Internals'

end

#Run the fOOrth unit test suite.
Rake::TestTask.new do |t|
  #List out all the test files.
  t.test_files = FileList['tests/**/*.rb']
  t.verbose = false
end

desc "Run a scan for smelly code!"
task :reek do |t|
  `reek --no-color lib > reek.txt`
end

desc "Fire up an IRB session with the game preloaded."
task :console do
  require 'irb'
  require 'irb/completion'
  require './lib/connect_n_game'
  puts "Starting an IRB console for connect_n_game."
  ARGV.clear
  IRB.start
end

desc "What version of the connect_n_game is this?"
task :vers do |t|
  puts
  puts "connect_n_game version = #{ConnectNGame::VERSION}"
end

