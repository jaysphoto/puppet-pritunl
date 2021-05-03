require 'rake/clean'
require 'rubocop/rake_task'

CLEAN.include('spec/fixtures/')

require 'puppetlabs_spec_helper/rake_tasks'

task test: %w[rubocop spec]
task default: %i[clean spec]
