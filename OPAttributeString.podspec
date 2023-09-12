#
# Be sure to run `pod lib lint OPAttributeString.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OPAttributeString'
  s.version          = '0.1.1'
  s.summary          = '链式编程创建属性字符串'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/urm9ril/OPAttributeString'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'urm9ril' => '348043793@qq.com' }
  s.source           = { :git => 'https://github.com/urm9ril/OPAttributeString.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'OPAttributeString/Classes/**/*'
  s.public_header_files = 'OPAttributeString/Classes/OPAttributeString.h'
  
  s.pod_target_xcconfig   = {
    'EXCLUDED_ARCHS[sdk=iphones*]' => 'armv7 armv7s',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'armv7 armv7s arm64',
    # 'VALID_ARCHS' => 'arm64'
    
  }
  s.user_target_xcconfig  = {
    'EXCLUDED_ARCHS[sdk=iphones*]' => 'armv7 armv7s',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'armv7 armv7s arm64',
    # 'VALID_ARCHS' => 'arm64'
  }
  
  # s.resource_bundles = {
  #   'OPAttributeString' => ['OPAttributeString/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
