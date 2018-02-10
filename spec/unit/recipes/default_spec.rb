require 'spec_helper'

describe 'plist_file on macOS' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'mac_os_x', version: '10.13',
                               step_into: ['mac_os_x_plist_file']).converge('test::plist_file')
  end

  it 'deletes the lockfile' do
    expect(chef_run).to delete_file('/Users/vagrant/Library/Preferences/us.zoom.xos.plist.lockfile')
  end

  it 'creates the plist file' do
    expect(chef_run).to create_cookbook_file('/Users/vagrant/Library/Preferences/us.zoom.xos.plist')
  end
end
