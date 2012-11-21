source 'http://rubygems.org'

gem 'sinatra'
gem 'resque', :git => "git://github.com/santthosh-aim/resque.git", :branch => '2.0+logging'
gem 'resque-scheduler', :require => 'resque_scheduler', :git => "git://github.com/santthosh-aim/resque-scheduler.git", :branch => 'master'
gem 'multi_json', '1.3.5'
gem 'rack'
gem 'rake'
gem 'resque-status', :git => "git://github.com/quirkey/resque-status.git", :branch => 'master'

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
