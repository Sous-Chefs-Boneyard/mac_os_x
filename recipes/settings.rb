#
# Original credit: Ben Bleything's workstation bootstrap config
# cookbook:
#
# https://github.com/bleything/bootstrap/tree/master/cookbooks/config
#
# Author:: Joshua Timberman <opensource@housepub.org>
# Copyright:: Copyright (c) 2012, Joshua Timberman
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

execute "killall Dock" do
  action :nothing
end

node['mac_os_x']['settings'].each do |domain,settings|
  settings.each do |k,v|
    next if k == 'domain'

    mac_os_x_userdefaults "#{settings['domain']}-#{k}" do
      domain settings['domain']
      key k
      value v
      sudo true if settings['domain'] =~ /^\/Library\/Preferences/
      global true if settings['domain'] =~ /^NSGlobalDomain$/
      notifies :run, "execute[killall Dock]" if settings['domain'] =~ /^com.apple.dock$/
    end
  end
end
