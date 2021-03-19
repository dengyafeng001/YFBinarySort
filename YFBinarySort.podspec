#
# Be sure to run `pod lib lint YFBinarySort.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YFBinarySort'
  s.version          = '1.0.0'
  s.summary          = '二进制重排order File文件生成'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = '二进制重排order File文件生成，减少启动过程中page fault异常次数'

  s.homepage         = 'http://172.16.7.53:9090/cpdaily-mobile/YFBinarySort'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dengyafeng001' => 'deng_web@163.com' }
  s.source           = { :git => 'ssh://git@172.16.7.53:2224/cpdaily-mobile/YFBinarySort.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'YFBinarySort/Classes/**/*'

  s.user_target_xcconfig = {'OTHER_CFLAGS' => '-fsanitize-coverage=func,trace-pc-guard',
    'OTHER_SWIFT_FLAGS' => '-sanitize-coverage=func -sanitize=undefined'
  }
  # s.resource_bundles = {
  #   'YFBinarySort' => ['YFBinarySort/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
