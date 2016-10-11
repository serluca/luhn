Pod::Spec.new do |s|
  s.name = 'Luhn'
  s.version = '2.1.0'
  s.license = 'MIT'
  s.summary = 'A base-independent implementation of the Luhn algorithm for Swift. Useful for generating and verifying check digits in arbitrary bases. '
  s.homepage = 'https://github.com/serluca/luhn'
  s.social_media_url = 'http://twitter.com/serluca'
  s.authors = { 'Luca Serpico' => 'serpicoluca@gmail.com' }
  s.source = { :git => 'https://github.com/serluca/luhn.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source_files = 'Sources/*.swift'
end
