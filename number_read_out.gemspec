# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'number_read_out/version'

Gem::Specification.new do |spec|
  spec.name          = "number_read_out"
  spec.version       = NumberReadOut::VERSION
  spec.authors       = ["Michail Pantelelis"]
  spec.email         = ["mpantel@aegean.gr"]

  spec.summary       = "Utility gem to convert numbers/currencies to text in Greek and English."
  spec.description   = %q{Convert numbers and currencies to text in Greek and English. Usefull where a full text number representation is needed as in cheques and invoices.}
  spec.homepage      = "https://github.com/mpantel/number_read_out"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #if spec.respond_to?(:metadata)
  #  spec.metadata['allowed_push_host'] = "https://rubygems.org"
  #else
  #  raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  #end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
