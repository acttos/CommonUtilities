Pod::Spec.new do |s|
  s.name         = "CUtil"
  s.version      = "0.1.4"
  s.summary      = "CUtil is a common utilities collection. It is designed as a tool-box for iOS development."
  s.author       = { "Acttos" => "acttosma@gmail.com", "Jason" => "majinshou@gmail.com" }
  s.social_media_url = "https://twitter.com/hulu0319"
  s.homepage     = "https://github.com/acttos/CommonUtilities"
  s.license      = { :type => "MIT", :file => "LICENSE" }


  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/acttos/CommonUtilities.git", :tag => s.version }
  s.public_header_files = "CUtil/*.h", "CUtil/**/*.h"
  s.source_files  = "CUtil/*.h", "CUtil/**/*.{h,m}"

  s.ios.framework = "UIKit"

end
