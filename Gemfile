# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.8'

gem 'bcrypt', '3.1.13'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap-sass'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'carrierwave',             '1.3.2'
gem 'coffee-rails', '~> 4.2'
gem 'faker'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '4.3.1'
gem 'mini_magick', '>= 4.9.4'
gem 'puma', '~> 3.11'
gem 'rails', '5.2.3'
gem 'ransack'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'will_paginate', '3.1.7'

group :production do
  gem 'fog-aws'
  gem 'pg', '>= 0.18', '< 2.0'
end

group :development, :test do
  gem 'byebug', platforms: %i(mri mingw x64_mingw)
  gem 'factory_bot_rails', '~> 4.10.0'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 4.0.0.beta2'
  gem 'rubocop', require: false
  gem 'rubocop-airbnb'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
  gem 'sqlite3'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'devise'
gem 'tzinfo-data', platforms: %i(mingw mswin x64_mingw jruby)
gem 'dotenv-rails'
