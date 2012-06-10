require 'resque'
require 'resque_scheduler'
require 'resque_scheduler/server'
require 'yaml'

rack_env = ENV['RACK_ENV'] || 'development'

if rack_env == 'production'
  $redis = 'redis.brightpush.in'
elsif rack_env == 'staging'
  $redis = 'redis.brightpushbeta.in'
elsif rack_env == 'development'
  $redis = 'redis.brightpushalpha.in'
else 
  $redis = 'localhost:6379'
end

# Setup the shared redis server
Resque.redis = $redis
Resque.schedule = YAML.load_file(File.join('config/resque_schedule.yml'))