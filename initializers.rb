require 'resque'
require 'resque_scheduler'
require 'resque_scheduler/server'
require 'yaml'
require 'resque-status'

rack_env = ENV['RACK_ENV'] || 'development'

if rack_env == 'production'
  $redis = 'redis.brightpush.in:6379'
elsif rack_env == 'qa'
  $redis = 'redis.brightpushbeta.in:6379'
elsif rack_env == 'development'
  $redis = 'redis.brightpushalpha.in:6379'
else 
  $redis = 'localhost:6379'
end

# Setup the shared redis server
Resque.redis = $redis
Resque::Plugins::Status::Hash.expire_in = (24 * 60 * 60) # 24hrs in seconds
Resque.schedule = YAML.load_file(File.join('config/resque_schedule.yml'))
Resque.logger = Logger.new("log/dashboard.log",'daily')
Resque.logger.level = Logger::INFO