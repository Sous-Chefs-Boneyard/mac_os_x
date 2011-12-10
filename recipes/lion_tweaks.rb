unless node['platform_version'].to_f < 10.7

  include_recipe "mac_os_x::lion_mail"
  
  mac_os_x_userdefaults "Disable Lions window animations" do
    domain "NSGlobalDomain"
    key "NSAutomaticWindowAnimationsEnabled"
    type "bool"
    value "NO"
    only_if "defaults read NSGlobalDomain NSAutomaticWindowAnimationsEnabled"
  end
  
  mac_os_x_userdefaults "Disable keyboard press and hold" do
    domain "ApplePressAndHoldEnabled"
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
    domain "AppleShowScrollBars"
    type "string"
    value "Always"
    global true
  end
  
  execute "chflags nohidden #{ENV['HOME']}/Library"

end
