Description
===========

Manage Mac OS X user defaults system.

Requirements
============

Platform
--------

Tested on Mac OS X 10.6.8, should work on any version.

Resource/Provider
=================

mac\_os\_x\_userdefaults
----

Manage the Mac OS X user defaults(1) system. The parameters to the resource are passed to the defaults command and the parameters follow convention of the OS X command. See the defaults(1) man page for detail on how the tool works.

### Actions

- :write: write the setting to the specified domain. Default.

### Attribute Parameters

- domain: The domain the defaults belong to. Required. Name attribute.
- global: Whether the domain is global. Can be true or false. Default false.
- key: The preference key. Required.
- value: The value of the key. Required.
- type: Value type of the preference key.
- sudo: Set to true if the setting requires privileged access to modify. Default false.

`value` settings of `1`, `TRUE` or `true` are treated as true by defaults(1), and are handled for truthiness in the provider.

### Limitations

The current version cannot handle plists or dictionaries.

Example Usage
=============

Simple example that uses the `com.apple.systempreferences` domain, with a single key and value.

    mac_os_x_userdefaults "enable time machine on unsupported volumes" do
      domain "com.apple.systempreferences"
      key "TMShowUnsupportedNetworkVolumes"
      value "1"
    end

Specify a global domain. Note that the key is not required for global domains.

    mac_os_x_userdefaults "full keyboard access to all controls" do
      domain "AppleKeyboardUIMode"
      global true
      value "2"
    end

A boolean type that uses truthiness (TRUE).

    mac_os_x_userdefaults "finder expanded save dialogs" do
      domain "NSNavPanelExpandedStateForSaveMode"
      global true
      value "TRUE"
      type "bool"
    end

A setting that uses an int (integer) type.

    mac_os_x_userdefaults "enable OS X firewall" do
      domain "/Library/Preferences/com.apple.alf"
      key "globalstate"
      value "1"
      type "int"
    end

LWRP's can send notifications, so we can change the Dock, and then refresh it to take effect.

    execute "killall Dock" do
      action :nothing
    end

    mac_os_x_userdefaults "set dock size" do
      domain "com.apple.dock"
      type "integer"
      key "tilesize"
      value "20"
      notifies :run, "execute[killall Dock]"
    end

This setting requires privileged access to modify, so tell it to use sudo. Note that this will prompt for the user password if sudo hasn't been modified for NOPASSWD.

    mac_os_x_userdefaults "disable time machine normal schedule" do
      domain "/System/Library/LaunchDaemons/com.apple.backupd-auto"
      key "Disabled"
      value "1"
      sudo true
    end

License and Author
==================

Author:: Joshua Timberman (<cookbooks@housepub.org>)

Copyright 2011, Joshua Timberman

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
