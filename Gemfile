source 'https://rubygems.org'

gemspec

gem 'paypal-sdk-core', :git => "https://github.com/paypal/sdk-core-ruby.git"

if File.exist? File.expand_path('../samples/adaptive_accounts_samples.gemspec', __FILE__)
  gem 'adaptive_accounts_samples', :path => 'samples', :require => false
  group :test do
    gem 'rspec-rails', '~> 2.14.1', :require => false
    gem 'capybara', '~> 2.0.3', :require => false
  end
end

group :test do
  gem 'rspec', '~> 2.14.1'
end
