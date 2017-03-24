# Adaptive Accounts SDK

The PayPal Adaptive Accounts SDK provides Ruby APIs to create and manage PayPal accounts, add payment methods to accounts and obtain account verification status using the PayPal Adaptive Accounts API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'paypal-sdk-adaptiveaccounts'
```

And then execute:

```sh
$ bundle
```

Or install it yourself as:

```sh
$ gem install paypal-sdk-adaptiveaccounts
```

## Configuration

For Rails application:

```sh
rails g paypal:sdk:install
```

For other ruby application, create a configuration file(`config/paypal.yml`):

```yaml
development: &default
  username: jb-us-seller_api1.paypal.com
  password: WX4WTU3S8MY44S7F
  signature: AFcWxV21C7fd0v3bYYYRCpSSRl31A7yDhhsPUU2XhtMoZXsWHFxu-RWy
  app_id: APP-80W284485P519543T
  http_timeout: 30
  mode: sandbox
  # # with certificate
  # cert_path: "config/cert_key.pem"
  # # with token authentication
  # token: ESTy2hio5WJQo1iixkH29I53RJxaS0Gvno1A6.YQXZgktxbY4I2Tdg
  # token_secret: ZKPhUYuwJwYsfWdzorozWO2U9pI
  # # with Proxy
  # http_proxy: http://proxy-ipaddress:3129/
  # # with device ip address
  device_ipaddress: "127.0.0.1"
  # # Sandbox email address
  sandbox_email_address: platform.sdk.seller@gmail.com
test:
  <<: *default
production:
  <<: *default
  mode: live
```

Load Configurations from specified file:

```ruby
PayPal::SDK::Core::Config.load('config/paypal.yml',  ENV['RACK_ENV'] || 'development')
```

## Example

```ruby
require 'paypal-sdk-adaptiveaccounts'

# device_ipaddress and sandbox_email_address is required for create_account.
@api = PayPal::SDK::AdaptiveAccounts::API.new(
  :mode      => "sandbox",  # Set "live" for production
  :app_id    => "APP-80W284485P519543T",
  :username  => "jb-us-seller_api1.paypal.com",
  :password  => "WX4WTU3S8MY44S7F",
  :signature => "AFcWxV21C7fd0v3bYYYRCpSSRl31A7yDhhsPUU2XhtMoZXsWHFxu-RWy",
  :device_ipaddress => "127.0.0.1",
  :sandbox_email_address => "platform.sdk.seller@gmail.com" )

# Build request object
@create_account = @api.build_create_account({
  :accountType => "Personal",
  :name => {
    :salutation => "Mr.",
    :firstName => "Bonzop",
    :middleName => "Simore",
    :lastName => "Zaius" },
  :dateOfBirth => "1968-01-01",
  :address => {
    :line1 => "1968 Ape Way",
    :city => "Austin",
    :state => "TX",
    :postalCode => "78750",
    :countryCode => "US" },
  :contactPhoneNumber => "5126914160",
  :homePhoneNumber => "5126914160",
  :mobilePhoneNumber => "5126914160",
  :currencyCode => "USD",
  :citizenshipCountryCode => "US",
  :preferredLanguageCode => "en_US",
  :notificationURL => "http://localhost:3000/samples/adaptive_accounts/ipn_notify",
  :emailAddress => "newEmailAddress@paypal.com",
  :registrationType => "Web",
  :createAccountWebOptions => {
    :returnUrl => "http://localhost:3000/samples/adaptive_accounts/create_account",
    :showAddCreditCard => true } })

# Make API call & get response
@create_account_response = @api.create_account(@create_account)

# Response status
if @create_account_response.success?
  print @create_account_response.accountId
else
  print @create_account_response.error[0].message
end
```


## Samples App

Add following line in rails `Gemfile`:

```ruby
gem 'paypal-sdk-adaptiveaccounts'
gem 'adaptive_accounts_samples', :git => "https://github.com/paypal/adaptiveaccounts-sdk-ruby.git", :group => :development
```

Configure routes(`config/routes.rb`):

```ruby
mount AdaptiveAccountsSamples::Engine => "/samples" if Rails.env.development?
```

To get default paypal configuration execute:

```sh
rails g paypal:sdk:install
```

Run `rails server` and check the samples.
