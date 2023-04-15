Pod::Spec.new do |spec|

  spec.name         = "JBDetector"
  spec.version      = "1.0.0"
  spec.summary      = "A Swift Package for detecting JailBroken iOS Device."
  spec.description  = <<-DESC
                      A Swift Package for detecting JailBroken iOS Device. Documentation: https://alfinsyahruddin.github.io/jb-detector
                      DESC
  spec.homepage     = "https://github.com/alfinsyahruddin/jb-detector"
  spec.license      = "MIT"
  spec.author             = { "Alfin" => "alfin.syahruddin@icloud.com" }
  spec.social_media_url   = "https://alfin.dev"
  spec.platform     = :ios, "11.0"
  spec.source       = { :git => "https://github.com/alfinsyahruddin/jb-detector.git", :tag => "#{spec.version}" }
  spec.source_files = "Sources/**/*.{swift}"
  spec.swift_version = "5.0"
  
end
