require 'capistrano/ext/multistage'
require "rvm/capistrano"
require "bundler/capistrano"

set :normalize_asset_timestamps, false
set :stages, ["development","qa", "production"]
set :default_stage, "development"
set :bundle_without, [:darwin, :development, :test]

set :rvm_type, :user
set :rvm_ruby_string, 'ruby-1.9.2-p318@workers'

set :scm, :git
set :scm_passphrase, ""
set :application, "brightpush-dashboard"
set :deploy_to, "/var/www/brightpush-dashboard"
set :repository,  "git@bright.unfuddle.com:bright/brightpush-dashboard.git"
set :user, "ubuntu"
set :rack_env,"development"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
 
 before 'deploy', 'rvm:install_ruby'
 
 after 'deploy:update_code', 'deploy:symlink_config'
 after 'deploy:symlink_config', 'deploy:start_dashboard'
 
 namespace :deploy do
  desc "Symlink configurations"
  task :symlink_config, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/config/resque_schedule.yml #{release_path}/config/resque_schedule.yml"
    run "ln -nfs #{deploy_to}/shared/config/authentication.yml #{release_path}/config/authentication.yml"
  end
   
  desc "Starts the dashboard and the scheduler"
  task :start_dashboard, :roles => :app do
    run "cd #{release_path} && bundle install"
    run "cd #{release_path} && scripts/scheduler restart #{rack_env}"
  end
 end
 
 namespace :apache do
   [:stop, :start, :restart, :reload].each do |action|
     desc "#{action.to_s.capitalize} Apache"
     task action, :roles => :web do
       invoke_command "/etc/init.d/apache2 #{action.to_s}", :via => run_method
     end
   end
 end