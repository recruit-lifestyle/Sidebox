#
# Be sure to run `pod lib lint Sidebox.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Sidebox"
  s.version          = "1.0.3"
  s.summary          = "Library for ViewController with Temporary storage function."
  s.description      = <<-DESC
                       Sidebox

                       This library enable user to
                       * temporary storage
                       * quick comparison
                       DESC
  s.homepage         = "https://github.com/recruit-lifestyle/Sidebox"
  s.screenshots     = "https://github.com/recruit-lifestyle/Sidebox/wiki/images/screenshot1.png", "https://github.com/recruit-lifestyle/Sidebox/wiki/images/screenshot2.png"
  s.license          = 'MIT'
  s.author           = { "Nonchalant" => "t_ihara@waku-2.com" }
  s.source           = { :git => "https://github.com/recruit-lifestyle/Sidebox.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/l_index'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'Sidebox' => ['Pod/Assets/*.png']
  }
end
