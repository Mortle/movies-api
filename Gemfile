# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# ENV configuration
gem 'dotenv-rails', '~> 2.7.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'

# Serializing
gem 'jsonapi-serializer', '~> 2.2.0'

# Auth
gem 'devise_token_auth', '~> 1.1.5'
gem 'pundit', '~> 2.1.0'

gem 'rack-cors', '~> 1.1.1'

# Encapsulation
gem 'interactor', '~> 3.0'

# Third-party API requests
gem 'httparty', '~> 0.17.3'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Debugging
  gem 'pry'

  # Styling
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :development do
  # Annotating schema
  gem 'annotate', '~> 3.1.1'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
