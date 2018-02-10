#
# Cookbook:: mac_os_x
#
# Copyright:: 2011-2018, Joshua Timberman
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

# This is the source from in the cookbook files directory
property :source, String, name_attribute: true
# The cookbook in which a source is located. Defaults to this cookbook.
property :cookbook, String
property :user, String

action :create do
  home = new_resource.user.nil? ? '/' : "/Users/#{new_resource.user}/"
  file "#{home}Library/Preferences/#{new_resource.source}.lockfile" do
    action :delete
  end

  cookbook_file "#{home}Library/Preferences/#{new_resource.source}" do
    source new_resource.source
    cookbook new_resource.cookbook unless new_resource.cookbook.nil?
  end
end
