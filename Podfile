# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'SampleDemo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
   pod 'MBProgressHUD'
   pod 'IQKeyboardManager'
   pod 'Moya'
   pod 'Cache'
   pod 'IQKeyboardManagerSwift'
   pod 'Toaster'
   pod 'SDWebImage', '~> 5.0'
   pod 'SDWebImageWebPCoder'
   pod 'SWRevealViewController'
   pod 'iOSDropDown'
   pod 'Alamofire'
  
  
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["IPHONEOS_DEPLOYMENT_TARGET"] = "13.0"
    end
  end
end
