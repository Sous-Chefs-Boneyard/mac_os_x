mac_os_x_userdefaults 'Disable fast user switching' do
  domain '/Library/Preferences/.GlobalPreferences'
  key 'MultipleSessionEnabled'
  value 0
end
