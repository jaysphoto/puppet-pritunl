require 'rake/clean'
require 'rubocop/rake_task'
require 'puppet-lint/tasks/puppet-lint'

CLEAN.include('spec/fixtures/')

require 'puppetlabs_spec_helper/rake_tasks'

PuppetLint::RakeTask.new :lint do |config|
  # Pattern of files to check, defaults to `**/*.pp`
  config.pattern = 'manifests/**/*.pp'
  # Print out the context for the problem, defaults to false
  config.with_context = true
end

task test: %w[rubocop lint spec]
task default: %i[clean test]
