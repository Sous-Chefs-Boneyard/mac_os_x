#
# Cookbook Name:: mac_os_x
# Recipe:: finder
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

mac_os_x_userdefaults "finder expanded save dialogs" do
  key "NSNavPanelExpandedStateForSaveMode"
  type "bool"
  value true
  global true
end

mac_os_x_userdefaults "dont show hard drives on the desktop" do
  domain "com.apple.finder"
  key "ShowHardDrivesOnDesktop"
  value false
  type "bool"
end

mac_os_x_userdefaults "show all files in Finder" do
  domain "com.apple.finder"
  key "AppleShowAllFiles"
  value false
  type "bool"
end

# TODO:
# com.apple.finder:
# StandardViewSettings = {
#   ExtendedListViewSettings = {
#     showIconPreview = 0;
#     useRelativeDates = 0;
#   };
#   ListViewSettings = {
#     showIconPreview = 0;
#     useRelativeDates = 0;
#   };
# }
