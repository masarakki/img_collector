source 'http://rubygems.org'

gem 'rails', '3.1.0'
gem 'haml'

group :production do
  gem 'mysql2'
end

group :test, :development do
  gem "sqlite3"
  gem "rspec-rails"
  gem "auto_mock"
  gem "webrat"
  gem "autotest"
  gem "cover_me"
end

group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

gem 'capistrano'

group :test do
  gem 'turn', :require => false
end
