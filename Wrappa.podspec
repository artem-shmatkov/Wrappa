Pod::Spec.new do |s|
  s.name     = 'Wrappa'
  s.version  = '0.1.0'
  s.license  = { :type => 'MIT' }
  s.summary  = 'UITableView and other classes wrappers to make it easier to create iOS interfaces.'
  s.homepage = 'https://github.com/zakhej/Wrappa'
  s.authors  = { 'Art Shmatkov' => 'zakhej.freelance@gmail.com' }
  s.source   = { :git => 'https://github.com/zakhej/Wrappa.git', :tag => '0.1.0' }
  s.requires_arc = true
  s.public_header_files = 'Wrappa/*.h'
  s.source_files = 'Wrappa/Wrappa.h', 
  'Wrappa/Wrappers/UITableView/WRTableSource.{h,m}', 
  'Wrappa/Wrappers/UITableView/WRTableSection.{h,m}', 
  'Wrappa/Wrappers/UITableView/Categories/UITableView+Wrappa.{h,m}',
  'Wrappa/Wrappers/UITableView/Cells/WRTableCell.{h,m}', 
  'Wrappa/Wrappers/UITableView/Cells/WRTableCellSource.{h,m}', 
  'Wrappa/Wrappers/UITableView/Cells/WRTableCellProtocol.h', 
  'Wrappa/Wrappers/UITableView/Cells/WRTableCellSourceProtocol.h'
  s.ios.deployment_target = '6.0'
end
