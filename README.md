# Spree Subscriptions

A Spree extension that enables subscription services.

## Features

* Provides administrators the ability to make items subscribable.
* Option for recurring payments.
* Set time intervals for shipments.
* Provides customers the ability to create subscriptions.

## Installation

Add gem to Gemfile:

```ruby
gem 'spree_subscriptions', github: 'DynamoMTL/spree_subscriptions.git'
```

Install with bundle and run the generator.

```bash
bundle install    
rails g spree_subscriptions:install
```

## Testing

Make sure to bundle dependencies and create dummy test app to run against specs.

```bash
bundle
bundle exec rake test_app
bundle exec rspec spec
```

Copyright (c) 2013 [Dynamo], released under the New BSD License
