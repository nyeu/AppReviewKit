#
# Be sure to run `pod lib lint AppReviewKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AppReviewKit'
  s.version          = '0.1.1'
  s.summary          = 'AppReviewKit helps you gain more positive and meaninful app reviews.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  AppReviewKit helps you gain more positive and meaninful app reviews by making sure only users with a good experience are shown the system review. It also helps you gather feedback on what to improve by asking those users that are not happy with how the app behaves to send you an email with improvements.
                       DESC

  s.homepage         = 'https://github.com/nyeu/AppReviewKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'nyeu' => 'joancardona@gmail.com' }
  s.source           = { :git => 'https://github.com/nyeu/AppReviewKit.git', :tag => s.version.to_s }
   s.social_media_url = 'https://twitter.com/nyeeu'

  s.ios.deployment_target = '13.0'
  s.swift_version = "5.0"
  s.source_files = 'AppReviewKit/Classes/**/*'
  

   s.frameworks = 'UIKit', 'StoreKit', 'MessageUI'
   s.dependency 'SnapKit', '~> 5.0'
end
