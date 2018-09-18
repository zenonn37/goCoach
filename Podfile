
platform :ios, '11.4'

target 'GoCoach' do
   use_frameworks!

  # Pods for GoCoach

  target 'GoCoachTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'GoCoachUITests' do
    inherit! :search_paths
    # Pods for testing
  end
  
  
  
pod 'RealmSwift'
pod 'Spring', :git => 'https://github.com/MengTo/Spring.git'
pod 'TPKeyboardAvoiding'

 post_install do |installer|
installer.pods_project.build_configurations.each do |config|
config.build_settings.delete('CODE_SIGNING_ALLOWED')
config.build_settings.delete('CODE_SIGNING_REQUIRED')

end
end

end
