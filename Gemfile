source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '~> 4.0.0'

gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

# To more easily serve static pages
gem 'high_voltage'

# User authentication
gem 'devise'

# Form generator compatible with Bootstrap
gem 'simple_form', '3.0.0.rc'

# RSS/Atom parser
gem 'feedzirra', '0.2.0.rc2'
gem 'sax-machine'

# HTTP client
gem 'rest-client'

# To parse html
gem 'nokogiri'

# Background jobs
gem 'resque'
gem 'resque-scheduler', :require => 'resque_scheduler'

# Process monitoring
gem 'god'

# Automate deployments
gem 'capistrano', require: false
gem 'rvm-capistrano', require: false

# Authorization management
gem 'cancan'

# Manage zip files
gem 'rubyzip'

group :test, :development do
  # Sqlite database for testing and development
  gem 'sqlite3'

  # Static code vulnerability scanner
  gem 'brakeman', require: false

  # Testing framework
  gem 'rspec-rails', '~> 2.0'

  # Factories instead of DB fixtures during testing
  gem 'factory_girl_rails'
end

group :test do
  # Code coverage
  gem 'coveralls', require: false

  # To simulate a user's browser during acceptance testing
  gem 'capybara'
  gem 'capybara-webkit'

  # To be able to open the browser during debugging of acceptance tests
  gem 'launchy'

  # To empty the database between acceptance tests
  gem 'database_cleaner'
end

group :staging, :production do
  # Mysql database for staging and production
  gem 'mysql2'

  # Access Amazon AWS programattically
  gem 'aws-sdk'
end
