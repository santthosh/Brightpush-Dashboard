require 'resque'
require 'resque_scheduler'
require 'resque_scheduler/server'
require 'yaml'

rails_env = ENV['RAILS_ENV'] || 'development'

if rails_env == 'production'
  $redis = 'redis.brightpush.in'
elsif rails_env == 'staging'
  $redis = 'redis.brightpushbeta.in'
elsif rails_env == 'development'
# This is mapped to redis.brightpushalpha.in
  $redis = '50.112.241.56:6379'
else 
  $redis = 'localhost:6379'
end

# Setup the shared redis server
Resque.redis = $redis
Resque.schedule = YAML.load_file(File.join('config/resque_schedule.yml'))