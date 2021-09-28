Pod::Spec.new do |spec|

  spec.name         = "KZRazor"
  spec.version      = "0.0.12"
  spec.summary      = "A tool kit"


  spec.homepage     = "https://github.com/zzzwco/KZRazor"

  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "zzzwco" => "zzzwco@outlook.com" }
  spec.social_media_url   = "https://twitter.com/zzzwco"

  spec.ios.deployment_target = "11.0"

  spec.requires_arc = true
  spec.swift_versions = "5.0"
  spec.source       = { :git => "https://github.com/zzzwco/KZRazor.git", :tag => spec.version }
  spec.source_files  = "Source", "Source/*.swift"

  spec.dependency "SnapKit"
  spec.dependency "QMUIKit"
  spec.dependency "SwiftMessages"

end
