Pod::Spec.new do |s|
  s.name         = "JLCalendarView"
  s.version      = "0.9.3"
  s.summary      = "Calendar View"
  s.homepage     = "https://github.com/joelai/JLCalendarView"
  s.license      = { :type => 'MIT License', :file => 'LICENSE' }
  s.author       = { "Joe Lai" => "joe.lai.cn@gmail.com" } 
  s.source       = { :git => "https://github.com/joelai/JLCalendarView.git", :tag => s.version }
  s.platform     = :ios, '8.0'
  s.source_files = 'JLCalendarView/*.swift'
  s.requires_arc = true
end