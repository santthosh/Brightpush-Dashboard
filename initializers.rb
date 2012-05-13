require 'resque'
require 'resque_scheduler'
require 'resque_scheduler/server'
require 'resque-status'
require 'resque/status_server'
require 'yaml'

rails_env = ENV['RAILS_ENV'] || 'development'

if rails_env == 'production'
  $redis = 'redis.brightpush.in'
elsif rails_env == 'staging'
  $redis = 'redis.brightpushbeta.in'
elsuf rails_env == 'test'
  $redis = 'redis.brightpushalpha.in'
else 
  $redis = 'localhost:6379'
end

# Setup the shared redis server
Resque.redis = $redis
Resque::Plugins::Status::Hash.expire_in = (24 * 60 * 60) # 24hrs in seconds
Resque.schedule = YAML.load_file(File.join('config/resque_schedule.yml'))