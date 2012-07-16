require 'resque'
require 'resque_scheduler'
require 'resque_scheduler/server'
require 'yaml'

rack_env = ENV['RACK_ENV'] || 'development'

if rack_env == 'production'
  $redis = 'redis.brightpush.in'
elsif rack_env == 'qa'
  $redis = 'redis.brightpushbeta.in:6379'
elsif rack_env == 'development'
  $redis = 'redis.brightpushalpha.in:6379'
else 
  $redis = 'localhost:6379'
end

# Setup the shared redis server
Resque.redis = $redis
#Resque.schedule = YAML.load_file(File.join('config/resque_schedule.yml'))