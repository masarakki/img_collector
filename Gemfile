source 'http://rubygems.org'

gem 'rails'
gem 'haml-rails'
gem 'twitter-bootstrap-rails'
gem 'mona'
gem 'curb'
gem 'nokogiri'
gem 'unicorn'
gem 'jquery-rails'
gem 'libv8', '3.11.8.2'
group :production do
  gem 'mysql2'
end

group :test, :development do
  gem "sqlite3"
  gem "rspec-rails"
  gem "auto_mock"
  gem "webrat"
  gem "guard-spork"
  gem "guard-rspec"
  gem "guard-rails"
  gem 'factory_girl_rails'
  gem "guard-livereload"
end

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :development do
  gem 'capistrano'
  gem 'capistrano_colors'
  gem 'capistrano-unicorn'
  gem 'rvm-capistrano'
end

group :test do
  gem 'turn', :require => false
end
