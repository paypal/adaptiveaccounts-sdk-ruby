# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paypal-sdk/adaptive_accounts/version'

Gem::Specification.new do |gem|
  gem.name          = "paypal-sdk-adaptiveaccounts"
  gem.version       = PayPal::SDK::AdaptiveAccounts::VERSION
  gem.authors       = ["PayPal"]
  gem.email         = ["DL-PP-Platform-Ruby-SDK@ebay.com"]
  gem.summary       = %q{PayPal Adaptive Accounts SDK}
  gem.description   = %q{The PayPal Adaptive Accounts SDK provides Ruby APIs to create and manage PayPal accounts, add payment methods to accounts and obtain account verification status using the PayPal Adaptive Accounts API.}
  gem.homepage      = "https://developer.paypal.com"

  gem.files         = Dir["{bin,spec,lib}/**/*"] + ["Rakefile", "README.md", "Gemfile"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('paypal-sdk-core', '~> 0.3.0')
end
