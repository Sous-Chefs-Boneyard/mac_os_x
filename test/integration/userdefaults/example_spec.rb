# # encoding: utf-8

# Inspec test for recipe mac_os_x::test

describe command('defaults read /Library/Preferences/.GlobalPreferences "MultipleSessionEnabled"') do
  its('stdout') { should match(/0/) }
end
