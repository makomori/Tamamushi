Pod::Spec.new do |s|
  s.name             = "Tamamushi"
  s.version          = "0.1.0"
  s.summary          = "Easy to use gradient UINavigationBar library written in Swift"
  s.homepage         = "https://github.com/makomori/Tamamushi"
  s.license          = 'MIT'
  s.author           = { "makomori" => "makomori26@gmail.com" }
  s.source           = { :git => "https://github.com/makomori/Tamamushi.git", :tag => s.version.to_s }
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'Tamamushi/*.swift'
  # s.resources    = ['Tamamushi/Assets.xcassets', 'Tamamushi/*.xib']
end
