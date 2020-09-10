#
# Be sure to run `pod lib lint KongServiceAuthentication.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KongServiceAuthenticationKit'
  s.version          = '1.0.3'
  s.summary          = 'KongService를 이용할 수 있는 프레임워크 입니다.'
  s.description      = 'KongService를 이용할 수 있는 프레임워크 입니다.'
  s.homepage         = 'https://github.com/kong-tech/KongServiceAuthenticationKit-iOS'
  s.license          = { :type => 'Apache2.0', :file => 'LICENSE.md' }
  s.author           = { 'kongljh' => 'kongljh@kong-tech.com' }
  s.source           = { :git => 'https://github.com/kong-tech/KongServiceAuthenticationKit-iOS.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'
  s.source_files = 'KongServiceAuthenticationKit/**/**/*'
end
