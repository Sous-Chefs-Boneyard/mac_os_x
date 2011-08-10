mac_os_x_userdefaults "Disable Lions window animations" do
  domain "NSGlobalDomain"
  key "NSAutomaticWindowAnimationsEnabled"
  type "bool"
  value "NO"
  only_if "defaults read NSGlobalDomain NSAutomaticWindowAnimationsEnabled"
end

mac_os_x_userdefaults "Disable keyboard press and hold" do
  key "ApplePressAndHoldEnabled"
  value "false"
  global true
end

mac_os_x_userdefaults "Disable automatic spelling correction" do
  domain "NSGlobalDomain"
  key "NSAutomaticSpellingCorrectionEnabled"
  value "NO"
  type "bool"
end

mac_os_x_userdefaults "Always show scrollbars" do
  key "AppleShowScrollBars"
  type "string"
  value "Always"
  global true
end

%w[Reply, Send].each do |animation|

  mac_os_x_userdefaults "Disable Lions mail #{animation} animation" do
    domain "com.apple.Mail"
    key "Disable#{animation}Animations"
    value "YES"
    type "bool"
  end

end

execute "chflags nohidden #{ENV['HOME']}/Library"
