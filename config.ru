$LOAD_PATH.unshift File.dirname(__FILE__) unless $LOAD_PATH.include?(File.dirname(__FILE__))

# This file is used by Rack-based servers to start the application.
require File.dirname(__FILE__) + '/config/boot.rb'
require 'initializers'
require 'app'

set :environment, ENV['RACK_ENV'].to_sym
set :app_file, 'app.rb'
disable :run

log = File.new("log/sinatra.log", "a")
STDOUT.reopen(log)
STDERR.reopen(log)

config = YAML.load_file("config/authentication.yml")

# Set the AUTH env variable to your basic auth password to protect Resque.
Resque::Server.use(Rack::Auth::Basic) do |user, password|
  user == config["basic_auth"]["username"] && password == config["basic_auth"]["password"]
end

run Rack::URLMap.new \
  "/" => Resque::Server.new(),
  "/ping" => Dashboard::App.new

