lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'srcei-tools/version'

Gem::Specification.new do |s|
  s.platform     = Gem::Platform::RUBY
  s.summary      = "SRCEI Tools"
  s.name         = 'srcei-tools'
  s.version      = SRCEITools::Version
  s.authors      = ['Gonzalo Rios']
  s.email        = 'contacto@gonzalorios.cl'
  s.licenses     = ['MIT']
  s.homepage     = 'https://github.com/xalupeao/srcei-tools'
  s.requirements << 'none'
  s.require_path = 'lib'
  s.files        = [
    'README.md',
    'lib/srcei-tools.rb',
    'lib/srcei-tools/validate_di.rb',
    'lib/srcei-tools/version.rb'
  ]
  s.description  = 'Validar numero de serie de documento nacional RUT Chile'

  s.add_dependency 'mechanize', '~> 2.7'
end
