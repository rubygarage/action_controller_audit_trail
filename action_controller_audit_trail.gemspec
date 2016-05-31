# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
$:.push File.expand_path("../lib", __FILE__)

require 'action_controller_audit_trail/version'

Gem::Specification.new do |spec|
  spec.name          = "action_controller_audit_trail"
  spec.version       = ActionControllerAuditTrail::VERSION
  spec.authors       = ["Roman Mukhin"]
  spec.email         = ["roman@rubygarage.org"]
  spec.platform      = 'ruby'

  spec.summary       = %q{Gem for controller actions tracking}
  spec.description   = %q{Use this gem to track controller actions and the model success/failure manipulations in controllers}
  spec.homepage      = "https://rubygarage.org"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end
  spec.files = Dir.glob("{lib}/**/*")
  #spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_dependency "sucker_punch"
  spec.add_development_dependency 'rails'
end
