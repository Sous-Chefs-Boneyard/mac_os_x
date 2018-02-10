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

property :domain, String, name_property: true, required: true
property :global, [true, false], default: false
property :key, [String, nil], default: nil
property :value, [Integer, Float, String, true, false, Hash, Array], required: true
property :type, String, default: ''
property :user, [String, nil], default: nil
property :sudo, [true, false], default: false
property :is_set, [true, false], default: false

action :write do
  @userdefaults = Chef::Resource.resource_for_node(:mac_os_x_userdefaults, node).new(new_resource.name)
  @userdefaults.key(new_resource.key)
  @userdefaults.domain(new_resource.domain)
  Chef::Log.debug("Checking #{new_resource.domain} value")
  truefalse = 1 if [true, 'TRUE', '1', 'true', 'YES', 'yes'].include?(new_resource.value)
  truefalse = 0 if [false, 'FALSE', '0', 'false', 'NO', 'no'].include?(new_resource.value)

  drcmd = "defaults read '#{new_resource.domain}' "
  drcmd << "'#{new_resource.key}' " if new_resource.key
  shell_out_opts = {}
  shell_out_opts[:user] = new_resource.user unless new_resource.user.nil?
  vc = shell_out("#{drcmd} | grep -qx '#{truefalse || new_resource.value}'", shell_out_opts)

  is_set = vc.exitstatus == 0 ? true : false
  @userdefaults.is_set(is_set)

  unless @userdefaults.is_set
    cmd = ['defaults write']
    cmd.unshift('sudo') if new_resource.sudo

    cmd << if new_resource.global
             'NSGlobalDomain'
           else
             "'#{new_resource.domain}'"
           end

    cmd << "'#{new_resource.key}'" if new_resource.key
    value = new_resource.value
    type = new_resource.type.empty? ? value_type(value) : new_resource.type
    # creates a string of Key1 Value1 Key2 Value2...
    value = value.map { |k, v| "\"#{k}\" \"#{v}\"" }.join(' ') if type == 'dict'
    if type == 'array'
      value = value.join("' '")
      value = "'#{value}'"
    end
    cmd << "-#{type}" if type
    cmd << value

    execute cmd.join(' ') do
      user new_resource.user unless new_resource.user.nil?
    end
  end
end
