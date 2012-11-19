require 'resque/tasks'
require 'resque_scheduler/tasks'
require 'yaml'

task :default => :help

namespace :resque do
  task :setup do
    require 'resque'
    require 'resque_scheduler'
    require 'resque/scheduler'
           
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
    Resque.redis.namespace = "resque"
    
    # If you want to be able to dynamically change the schedule,
    # uncomment this line.  A dynamic schedule can be updated via the
    # Resque::Scheduler.set_schedule (and remove_schedule) methods.
    # When dynamic is set to true, the scheduler process looks for
    # schedule changes and applies them on the fly.
    # Note: This feature is only available in >=2.0.0.
    Resque::Scheduler.dynamic = true

    # The schedule doesn't need to be stored in a YAML, it just needs to
    # be a hash.  YAML is usually the easiest.
    Resque.schedule = YAML.load_file('config/resque_schedule.yml')

    # If your schedule already has +queue+ set for each job, you don't
    # need to require your jobs.  This can be an advantage since it's
    # less code that resque-scheduler needs to know about. But in a small
    # project, it's usually easier to just include you job classes here.
    # So, someting like this:
    # require 'jobs'
  end
end

desc "Run specs"
task :spec do
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = './spec/**/*_spec.rb'
  end
end

desc "Run IRB console with app environment"
task :console do
  puts "Loading development console..."
  system("irb -r ./config/boot.rb")
end

desc "Show help menu"
task :help do
  puts "Available rake tasks: "
  puts "rake console - Run a IRB console with all enviroment loaded"
  puts "rake spec - Run specs and calculate coverage"
end

