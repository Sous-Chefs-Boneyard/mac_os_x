name             'mac_os_x'
source_url       'https://github.com/sous-chefs/mac_os_x'
issues_url       'https://github.com/sous-chefs/mac_os_x/issues'
maintainer       'Sous Chefs'
maintainer_email 'help@sous-chefs.org'
license          'Apache 2.0'
description      'Manage OS X user defaults settings and plist files'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.4.5'
supports         'mac_os_x'
chef_version     '>= 12.7' if respond_to?(:chef_version)
