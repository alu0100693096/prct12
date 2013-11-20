require "bundler/gem_tasks"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new
task :default => :spec

desc "Ejecutamos las pruebas unitarias"
task :test do
  sh "ruby -I. test/ts_matrices.rb"
end
