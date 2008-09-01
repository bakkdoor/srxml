require "rake"
require "rake/testtask"
require "rake/rdoctask"
require "rake/clean"
require "rake/gempackagetask"
 
task :default => [ :test ]
task :test    => [ :test_units ]
  
desc "run unit tests in test/unit"
rt = Rake::TestTask.new("test_units") do |t|
  t.libs << "test/unit"
  t.pattern = "test/test_*.rb"
  t.verbose = true
end