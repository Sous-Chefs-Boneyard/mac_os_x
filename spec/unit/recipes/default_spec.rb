require 'spec_helper'

describe 'Default recipe on MAC_OS_X: 10.9.2' do
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'mac_os_x', version: '10.9.2') }

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end
