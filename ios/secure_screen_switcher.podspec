#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint secure_screen_switcher.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'secure_screen_switcher'
  s.version          = '0.0.1'
  s.summary          = 'A flutter project to add simple security to flutter mobile apps so that screens are obscured when in the background (switcher) without having to mess with native code'
  s.description      = <<-DESC
  A flutter project to add simple security to flutter mobile apps so that screens are obscured when in the background (switcher) without having to mess with native code
                       DESC
  s.homepage         = 'https://github.com/pseudorand-dev/secure_screen_switcher'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'pseudorand development' => 'pseudorand.dev@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
