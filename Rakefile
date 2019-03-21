require "appraisal"
require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rubocop/rake_task"

RSpec::Core::RakeTask.new(:test)

RuboCop::RakeTask.new(:lint) do |task|
  task.options = ["--only", "Lint,Performance,Style"]
end

task :default => :test

task :validate => [:lint, :test]
