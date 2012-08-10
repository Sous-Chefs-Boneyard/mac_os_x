#
# Cookbook Name:: mac_os_x
# Provider:: userdefaults
#
# Copyright 2011, Joshua Timberman
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

require 'chef/mixin/shell_out'
require 'chef/mixin/language'
include Chef::Mixin::ShellOut

def load_current_resource
  @userdefaults = Chef::Resource::MacOsXUserdefaults.new(new_resource.name)
  @userdefaults.key(new_resource.key)
  @userdefaults.domain(new_resource.domain)
  Chef::Log.debug("Checking #{new_resource.domain} value")
  truefalse = 1 if ['TRUE','1','true','YES','yes'].include?(new_resource.value)
  truefalse = 0 if ['FALSE','0','false','NO','no'].include?(new_resource.value)
  drcmd = "defaults read #{new_resource.domain} "
  drcmd << "-g " if new_resource.global
  drcmd << "#{new_resource.key} " if new_resource.key
  v = shell_out("#{drcmd} | grep -qx '#{truefalse || new_resource.value}'")
  is_set = v.exitstatus == 0 ? true : false
  @userdefaults.is_set(is_set)
end

action :write do
  unless @userdefaults.is_set
    cmd = ["defaults write"]
    cmd.unshift('sudo') if new_resource.sudo

    if new_resource.global
      cmd << "NSGlobalDomain"
    else
      cmd << new_resource.domain
    end

    cmd << "'#{new_resource.key}'" if new_resource.key

    type = new_resource.type
    value = "'#{new_resource.value}'"
    case new_resource.value
    when TrueClass, FalseClass
      type ||= 'bool'
    when Integer
      type ||= 'int'
    when Float
      type ||= 'float'
    when Hash
      type ||= 'dict'

      # creates a string of Key1 Value1 Key2 Value2...
      value = new_resource.value.map {|k,v| "\"#{k}\" \"#{v}\"" }.join(' ')
    end

    cmd << "-#{type}" if type
    cmd << value
    execute cmd.join(' ')
    new_resource.updated_by_last_action(true)
  end
end
