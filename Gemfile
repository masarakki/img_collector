source 'http://rubygems.org'

gem 'rails', '3.2.1'
gem 'haml-rails'
gem 'twitter-bootstrap-rails'
group :production do
  gem 'mysql2'
end

group :test, :development do
  gem "sqlite3"
  gem "rspec-rails"
  gem "auto_mock"
  gem "webrat"
  gem "cover_me"
  gem "libnotify"
  gem "guard-spork"
  gem "guard-rspec"
  gem 'factory_girl_rails'
end

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

gem 'capistrano'

group :test do
  gem 'turn', :require => false
end
