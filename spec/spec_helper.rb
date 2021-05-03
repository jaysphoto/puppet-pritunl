RSpec.configure do |c|
  c.mock_with :rspec
  c.before(:each) do
    # Puppet::Util::Log.level = :warning
    # Puppet::Util::Log.newdestination(:console)
  end
end

require 'puppetlabs_spec_helper/module_spec_helper'
require 'rspec-puppet'
require 'rspec-puppet-utils'
