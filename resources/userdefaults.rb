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

actions :write

attribute :domain, :kind_of => String, :name_attribute => true, :required => true
attribute :global, :kind_of => [TrueClass, FalseClass], :default => false
attribute :key, :kind_of => String, :default => nil
attribute :value, :kind_of => [Integer,Float,String,TrueClass,FalseClass,Hash], :default => nil, :required => true
attribute :type, :kind_of => String, :default => nil
attribute :sudo, :kind_of => [TrueClass, FalseClass], :default => false
attribute :is_set, :kind_of => [TrueClass, FalseClass], :default => false

def initialize(*args)
  super
  @action = :write
end
