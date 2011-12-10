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
