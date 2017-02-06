Pod::Spec.new do |s|
  s.name = 'MD-Extensions'
  s.version = '0.2'
  s.license = 'Proprietary'
  s.summary = 'Swift extensions for the iOS mobile team'
  s.homepage = 'https://stash.mgmt.local/projects/IOSLIB/repos/md-extensions'
  s.authors = { 'Michael Leber' => 'michael.leber@markit.com' }
  s.source = { :git => 'ssh://git@stash.mgmt.local/ioslib/md-extensions.git', :tag => s.version }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Source/*.swift'

  s.ios.framework  = 'UIKit'
end