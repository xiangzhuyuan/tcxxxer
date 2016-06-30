# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tcxxxer/version'

Gem::Specification.new do |spec|
  spec.name          = "tcxxxer"
  spec.version       = Tcxxxer::VERSION
  spec.authors       = ["xiang zhuyuan"]
  spec.email         = ["xiangzhuyuan@gmail.com"]

  spec.summary       = %q{copy from rubist/guppy}
  spec.description   = %q{A converter for TCX/GPX file, you get can all `lap`, `track` info from the `tcx` file!}
  spec.homepage      = "https://github.com/xiangzhuyuan/tcxxxer"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri", "1.6.8"
end
