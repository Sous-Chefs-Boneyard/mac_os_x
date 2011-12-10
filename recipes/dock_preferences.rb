#
# Cookbook Name:: mac_os_x
# Recipe:: dock_preferences
#
# Author:: Joshua Timberman <opensource@housepub.org>
# Copyright:: Copyright (c) 2011, Joshua Timberman
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

%w{ autohide magnification workspaces-swoosh-animation-off }.each do |dock|

  mac_os_x_userdefaults "com.apple.dock #{dock}" do
    domain "com.apple.dock"
    key dock
    value "true"
    type "boolean"
    notifies :run, 'execute[killall Dock]'
  end

end

mac_os_x_userdefaults "com.apple.dock tile size" do
  domain "com.apple.dock"
  key "tilesize"
  value "20"
  type "integer"
  notifies :run, 'execute[killall Dock]'
end

execute "killall Dock" do
  action :nothing
end
