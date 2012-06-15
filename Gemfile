source 'http://rubygems.org'

gem 'sinatra'
gem 'resque'
gem 'resque-scheduler', '2.0.0.e', :require => 'resque_scheduler'
gem 'multi_json', '1.3.5'
gem 'rack'
gem 'rake'

group :development do
  gem 'capistrano', '2.8.0'
  gem 'capistrano-ext', '1.2.1'
  gem 'rvm-capistrano'
end

group :test, :development do
  gem "rspec", "~>2"
  gem "simplecov"
  gem 'rack-test'
  gem 'webrat'
end