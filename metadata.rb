name             'mac_os_x'
source_url       'https://github.com/sous-chefs/mac_os_x' if respond_to?(:source_url)
issues_url       'https://github.com/sous-chefs/mac_os_x/issues' if respond_to?(:issues_url)
maintainer       'Meg Cassidy'
maintainer_email 'Cassidy.Meg.L@gmail.com'
license          'Apache 2.0'
description      'Manage OS X user defaults settings and plist files'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.4.5'
supports         'mac_os_x'
chef_version     '>= 12.5' if respond_to?(:chef_version)
