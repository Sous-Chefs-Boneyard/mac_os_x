#
# Cookbook Name:: mac_os_x
# Recipe:: lion_ical
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

ruby_block "Backup iCal" do
  block do
    ::FileUtils.cp_r("/Applications/iCal.app", "/Applications/iCal-copy.app")
  end
  not_if {File.directory?("/Applications/iCal-copy.app")}
end

remote_file "#{Chef::Config[:file_cache_path]}/inmdin.zip" do
  source "https://files.me.com/eduncle/inmdin"
  checksum "8ede2aebf5271ce44a0093aefd5bd9484c5f3c2cca07212fa415d7988ba593d2"
  notifies :run, "execute[unzip inmdin.zip]", :immediately
end

execute "unzip inmdin.zip" do
  cwd Chef::Config[:file_cache_path]
  action :nothing
  notifies :create, "ruby_block[Aluminum iCal]", :immediately
end

ruby_block "Aluminum iCal" do
  block do
    theme_dir = "10.7-Lion-iCal-Aluminium-Skin-v2"
    ::FileUtils.cp_r("#{Chef::Config[:file_cache_path]}/#{theme_dir}",
                     "/Applications/iCal.app/Contents/Resources")
  end
  action :nothing
end
