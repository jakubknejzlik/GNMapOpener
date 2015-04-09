#
#  Be sure to run `pod spec lint GNMapOpener.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "GNMapOpener"
  s.version      = "0.0.1"
  s.summary      = "Wrapper for opening map location in map services."

  s.description  = "Wrapper for opening map location in map services using Google or Apple Maps"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Jakub Knejzlik" => "jakub.knejzlik@gmail.com" }

  s.platform     = :ios
  s.ios.deployment_target = "6.0"


  s.source       = { :git => "https://github.com/jakubknejzlik/GNMapOpener.git", :tag => s.version.to_s }



  s.source_files  = "GNMapOpener/**/*.{h,m}"

  s.frameworks = "CoreLocation", "MapKit"

  s.requires_arc = true

  s.dependency "JSONKit", "~> 1.4"
  s.dependency 'CWLSynthesizeSingleton', '~> 1.0'
  s.dependency 'UIActionSheet+Blocks', '0.8'
  s.dependency 'OpenInGoogleMaps', '~> 0.1'
end
