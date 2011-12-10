#
# Cookbook:: mac_os_x
# Recipe:: lion_mail
#
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
execute "Set Mail.app Archive to cmd-Y" do
  command "defaults write com.apple.mail NSUserKeyEquivalents -dict-add Archive '@y'"
  not_if "defaults read com.apple.mail NSUserKeyEquivalents 2>&1 | grep -q '.*Archive = \"@y\"'"
end

%w[Reply, Send].each do |animation|

  mac_os_x_userdefaults "Disable Lions mail #{animation} animation" do
    domain "com.apple.Mail"
    key "Disable#{animation}Animations"
    value 1
    type "bool"
  end

end
