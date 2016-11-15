Pod::Spec.new do |s|
  s.name             = "ReSwiftThunk"
  s.version          = "0.1.0"
  s.summary          = "Thunk middleware for ReSwift"
  s.description      = <<-DESC
                          A thunk middleware for ReSwift. Allows developers to create easily create async actions. Works well with promises.
                        DESC
  s.homepage         = "https://github.com/mikecole20/ReSwiftThunk"
  s.license          = { :type => "MIT", :file => "LICENSE.md" }
  s.author           = { "Mike Cole" => "mikecole20@gmail.com" }
  s.source           = { :git => "https://github.com/mikecole20/ReSwiftThunk.git", :tag => s.version.to_s }
  s.ios.deployment_target     = '8.0'
  s.osx.deployment_target     = '10.10'
  s.tvos.deployment_target    = '9.0'
  s.watchos.deployment_target = '2.0'
  s.requires_arc = true
  s.source_files     = 'ReSwiftThunk/**/*.swift'
  s.dependency 'ReSwift', '~> 3.0'
end