source 'http://rubygems.org'

gem 'rails'
gem 'haml-rails'
gem 'jquery-rails'
gem 'mona'
gem 'curb'
gem 'nokogiri'
gem 'unicorn'
gem 'twitter-bootstrap-rails'

group :production do
  gem 'mysql2'
end

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'less-rails'
  gem 'therubyracer'
end

group :test do
  gem 'turn', :require => false
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

  gem "rb-inotify", :require => false
  gem "rb-fsevent", :require => false
  gem "rb-fchange", :require => false

  gem "growl", :require => false
  gem "libnotify", :require => false
end

group :development do
  gem 'capistrano'
  gem 'capistrano_colors'
  gem 'capistrano-unicorn'
  gem 'rvm-capistrano'
end
