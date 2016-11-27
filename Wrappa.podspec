Pod::Spec.new do |s|
    s.name     = 'Wrappa'
    s.version  = '0.2.6'
    s.license  = { :type => 'MIT' }
    s.summary  = 'UITableView and UICollectionView wrapper to make it easier to create iOS interfaces.'
    s.homepage = 'https://github.com/zakhej/Wrappa'
    s.authors  = { 'Art Shmatkov' => 'zakhej.freelance@gmail.com' }
    s.source   = { :git => 'https://github.com/zakhej/Wrappa.git', :tag => '0.2.6' }
    s.requires_arc = true
    s.public_header_files = 'Wrappa source/**/*.h'
    s.source_files = 'Wrappa source/**/*.{h,m}'
    s.resources = 'Wrappa source/**/*.xib'
    s.ios.deployment_target = '6.0'
end
