#
# Original credit: Ben Bleything's workstation bootstrap config
# cookbook:
#
# https://github.com/bleything/bootstrap/tree/master/cookbooks/config
#
# Author:: Joshua Timberman <opensource@housepub.org>
# Copyright (c) 2012, Joshua Timberman
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

node.default['mac_os_x']['settings'] = {}

#######################################################################
#
# These commented attributes are provided as examples, though you are
# encouraged to set attributes from a role, rather than modifying the
# local cookbook directly.
#
# node.default['mac_os_x']['settings']['dock'] = {
#   "domain" => "com.apple.dock",
#   "no-glass" => true,
#   "autohide" => true,
#   "showhidden" => true,
#   "show-process-indicators" => false,
#   "checked-for-launchpad" => true
# }

# node.default['mac_os_x']['settings']['finder'] = {
#   "domain" => "com.apple.finder",
#   "FXPreferredViewStyle" => "Nlsv", # list view
#   "NewWindowTarget" => "PfHm", # home directory
#   "RemoveIDiskFromSidebarOnStartup" => true,
#   "ShowExternalHardDrivesOnDesktop" => true,
#   "ShowHardDrivesOnDesktop" => false,
#   "ShowMountedServersOnDesktop" => true,
#   "ShowRemovableMediaOnDesktop" => true,
#   "ShowStatusBar" => true,
# }

# node.default['mac_os_x']['settings']['global'] = {
#   "domain" => "NSGlobalDomain",
#   "NSNavPanelExpandedStateForSaveMode" => true,
#   "PMPrintingExpandedStateForPrint" => true,
#   "AppleAquaColorVariant" => 6,
#   "AppleHighlightColor" => "1.000000 0.823500 0.505900"
# }

# Corner action magic numbers:
#
# 0: no action
# 2: mission control
# 3: application windows
# 4: desktop
# 5: start screen saver
# 6: disable screen saver
# 7: dashboard
# 10: display sleep
# 11: launchpad
#
# node.default['mac_os_x']['settings']['hot_corners'] = {
#   "domain" => "com.apple.dock",
#   "wvous-tl-corner" => 0, # top left
#   "wvous-bl-corner" => 0, # bottom left
#   "wvous-tr-corner" => 0, # top right
#   "wvous-br-corner" => 0 # bottom right
# }

# node.default['mac_os_x']['settings']['safari'] = {
#   "domain" => "com.apple.Safari",
#   "IncludeDevelopMenu" => true,
#   "IncludeInternalDebugMenu" => true,
#   "AutoOpenSafeDownloads" => false,
#   "HomePage" => "https://www.google.com/",
#   "NewTabBehavior" => 1,
#   "NewWindowBehavior" => 0,
#   "TabCreationPolicy" => 1,
#   "ShowStatusBar" => true
# }

# node.default['mac_os_x']['settings']['screensaver'] = {
#   "domain" => "com.apple.screensaver"
#   "askForPassword" => 1,
#   "askForPasswordDelay" => 0
# }
