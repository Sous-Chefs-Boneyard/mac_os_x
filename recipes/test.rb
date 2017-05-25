#
# Cookbook Name:: mac_os_x
# Recipe:: test
#
# Author:: Sous Chefs <http://sous-chefs.org/>
# Copyright:: Copyright (c) 2017, Sous Chefs
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

mac_os_x_userdefaults 'Disable fast user switching' do
  domain '/Library/Preferences/.GlobalPreferences'
  key 'MultipleSessionEnabled'
  value 0
end

mac_os_x_plist_file 'Place zoom file' do
  source 'us.zoom.xos.plist'
  user 'vagrant'
end
