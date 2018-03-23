Pod::Spec.new do |s|
  s.name = 'MD-Extensions'
  s.version = '0.9'
  s.license = 'MIT'
  s.summary = 'Swift extensions for the iOS mobile team'
  s.homepage = 'https://github.com/markitondemand/Extensions'
  s.authors = { 'Michael Leber' => 'michael.leber@ihsmarkit.com,' }
  s.source = { :git => 'https://github.com/markitondemand/iOS-Extensions.git', :tag => s.version }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Source/*.swift'

  s.ios.framework = 'UIKit'
end
