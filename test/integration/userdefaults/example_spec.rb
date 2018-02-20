describe command('defaults read /Library/Preferences/.GlobalPreferences "MultipleSessionEnabled"') do
  its('stdout') { should match(/0/) }
end
