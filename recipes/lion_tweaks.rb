#
# Cookbook:: mac_os_x
# Recipe:: lion_tweaks

# Author:: Joshua Timberman <opensource@housepub.org>
# Copyright:: Copyright (c) 2011, Joshua Timberman
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
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
unless node['platform_version'].to_f < 10.7

  include_recipe "mac_os_x::lion_mail"

  execute "killall Dock" do
    action :nothing
  end

  mac_os_x_userdefaults "Disable Launchpad gesture" do
    domain "com.apple.dock"
    key "showLaunchpadGestureEnabled"
    type "bool"
    value false
    notifies :run, "execute[killall Dock]"
  end

  mac_os_x_userdefaults "Translucent hidden Dock icons" do
    domain "com.apple.Dock"
    key "showhidden"
    value true
    type "bool"
  end

  mac_os_x_userdefaults "0 Duration for Mission Control animation" do
    domain "com.apple.dock"
    key "expose-animation-duration"
    type "int"
    value false
    notifies :run, "execute[killall Dock]"
  end

  mac_os_x_userdefaults "Double tap switch spaces" do
    domain "com.apple.dock"
    key "double-tap-jump-back"
    type "bool"
    value true
    notifies :run, "execute[killall Dock]"
  end

  mac_os_x_userdefaults "Don't automatically rearrange spaces" do
    domain "com.apple.dock"
    key "mru-spaces"
    type "bool"
    value false
    notifies :run, "execute[killall Dock]"
  end

  mac_os_x_userdefaults "Disable Lions window animations" do
    domain "NSGlobalDomain"
    key "NSAutomaticWindowAnimationsEnabled"
    type "bool"
    value false
    only_if "defaults read NSGlobalDomain NSAutomaticWindowAnimationsEnabled"
  end

  mac_os_x_userdefaults "Disable keyboard press and hold" do
    key "ApplePressAndHoldEnabled"
    value false
    global true
  end

  mac_os_x_userdefaults "Disable automatic spelling correction" do
    domain "NSGlobalDomain"
    key "NSAutomaticSpellingCorrectionEnabled"
    value false
    type "bool"
  end

  %w{WebAutomaticDashSubstitutionEnabled
     WebAutomaticTextReplacementEnabled
     WebContinuousSpellCheckingEnabled}.each do |text|

    mac_os_x_userdefaults "Disable #{text}" do
      key text
      value false
      type "bool"
      global true
    end
  end

  mac_os_x_userdefaults "Disable AirDrop" do
    domain "com.apple.NetworkBrowser"
    key "DisableAirDrop"
    value true
    type "bool"
  end

  mac_os_x_userdefaults "Always show scrollbars" do
    key "AppleShowScrollBars"
    type "string"
    value "Always"
    global true
  end

  execute "chflags nohidden #{ENV['HOME']}/Library"

else
  Chef::Log.warn("#{cookbook_name}::#{recipe_name} is only supported on Mac OS X Lion (10.7)+")
  return
end
