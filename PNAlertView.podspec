
Pod::Spec.new do |s|


  s.name         = "PNAlertView"
  s.version      = "1.1.3"
  s.summary      = "iOS of PNAlertView."

  s.homepage     = "https://github.com/LiuPN/PNAlertView"

  s.license      = "Apache"

  s.author             = { "LiuPN" => "panniuliu@139.com" }
 
  s.platform     = :ios, "5.0"

  s.source       = { :git => "https://github.com/LiuPN/PNAlertView.git", :tag => "1.1.3" }

  s.source_files  = "PNAlertView", "PNAlertView/**/*.{h,m}"
  
   s.frameworks = "Foundation", "UIKit"

 
end
