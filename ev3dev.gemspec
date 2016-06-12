# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ev3dev/version'

Gem::Specification.new do |spec|
  spec.name          = "ev3dev_ruby"
  spec.version       = Ev3dev::VERSION
  spec.authors       = ["quake wang", "Yoshiyuki Shibata"]
  spec.email         = ["aqua055@gmail.com"]

  spec.summary       = %q{ev3dev_ruby}
  spec.description   = %q{ev3dev ruby binding for LEGO Mindstorms EV3}
  spec.homepage      = "https://github.com/noanoa07/ev3dev_ruby"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #if spec.respond_to?(:metadata)
  #  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  #else
  #  raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  #end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|examples)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
