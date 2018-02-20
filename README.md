# mac_os_x cookbook

This cookbook includes resources for managing local user settings on macOS:

- `macos_plist_file` - manages "`plist`" settings files for macOS applications.
- `macos_userdefaults` - manages settings in macOS's `defaults(1)` system.

## Requirements

### Platforms

- macOS

### Chef

- 12.7+

## Resources

### macos_userdefaults

Manage the macOS user defaults(1) system. The properties to the resource are passed to the defaults command and the parameters follow convention of the macOS command. See the defaults(1) man page for detail on how the tool works.

`note`: This resource was previously named mac_os_x_userdefaults and that name can still be used without issue.

#### Actions

- `:write`: write the setting to the specified domain. Default.

#### Properties

- `domain`: The domain the defaults belong to. Required.
- `global`: Whether the domain is global. Can be true or false. Default false.
- `key`: The preference key. Required.
- `value`: The value of the key. Required.
- `type`: Value type of the preference key.
- `user`: User for which to set the default.
- `sudo`: Set to true if the setting requires privileged access to modify. Default false.

`value` settings of `1`, `TRUE`, `true`, `YES` or `yes` are treated as true by defaults(1), and are handled in the resource. `value` settings of `0`, `FALSE`, `false`, `NO` or `no` are treated as false by defaults (1) and are also handled by the resource.

#### Limitations

The current version cannot handle plists or dictionaries.

#### Examples

Simple example that uses the `com.apple.systempreferences` domain, with a single key and value.

```ruby
macos_userdefaults "enable time machine on unsupported volumes" do
  domain "com.apple.systempreferences"
  key "TMShowUnsupportedNetworkVolumes"
  value "1"
end
```

A boolean type that uses truthiness (TRUE).

```ruby
macos_userdefaults "finder expanded save dialogs" do
  domain "NSNavPanelExpandedStateForSaveMode"
  global true
  value "TRUE"
  type "bool"
end
```

A setting that uses an int (integer) type.

```ruby
macos_userdefaults "enable macOS firewall" do
  domain "/Library/Preferences/com.apple.alf"
  key "globalstate"
  value "1"
  type "int"
end
```

Resources can send notifications, so we can change the Dock, and then refresh it to take effect.

```ruby
execute "killall Dock" do
  action :nothing
end

macos_userdefaults "set dock size" do
  domain "com.apple.dock"
  type "integer"
  key "tilesize"
  value "20"
  notifies :run, "execute[killall Dock]"
end
```

This setting requires privileged access to modify, so tell it to use sudo. Note that this will prompt for the user password if sudo hasn't been modified for NOPASSWD.

```ruby
macos_userdefaults "disable time machine normal schedule" do
  domain "/System/Library/LaunchDaemons/com.apple.backupd-auto"
  key "Disabled"
  value "1"
  sudo true
end
```

### macos_plist_file

Manages the property list (plist) preferences file with the `cookbook_file` Chef resource. Files will be dropped in `/Library/Preferences`, or `/Users/USER/Library/Preferences` if the `user` property is set.

`note`: This resource was previously named mac_os_x_plist_file and that name can still be used without issue.

#### Actions

- `:create`: create the file. Default.

#### Properties

- `source`: file name to use in the files directory of the cookbook. Name attribute.
- `cookbook`: cookbook where the plist file is located.

#### Examples

Write the iTerm 2 preferences to `~/Library/Preferences/com.googlecode.iterm2.plist`.

```ruby
macos_plist_file "com.googlecode.iterm2.plist"
```

## License and Author

- Author: Joshua Timberman ([cookbooks@housepub.org](mailto:cookbooks@housepub.org))
- Author: Ben Bleything ([ben@bleything.net](mailto:ben@bleything.net))
- Copyright 2011-2018, Joshua Timberman

```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
