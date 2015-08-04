Pod::Spec.new do |s|
  s.name     = 'Wrappa'
  s.version  = '0.1.0'
  s.license  = { :type => 'MIT' }
  s.summary  = 'UITableView and other classes wrappers to make it easier to create iOS interfaces.'
  s.homepage = 'https://github.com/zakhej/Wrappa'
  s.authors  = { 'Art Shmatkov' => 'zakhej.freelance@gmail.com' }
  s.source   = { :git => 'https://github.com/zakhej/Wrappa.git' }
  s.requires_arc = true
  s.public_header_files = 'Wrappa/*.h'
  s.source_files = 'Wrappa/Wrappa.h'
  s.ios.deployment_target = '6.0'
end
