$LOAD_PATH.unshift File.dirname(__FILE__) unless $LOAD_PATH.include?(File.dirname(__FILE__))

# This file is used by Rack-based servers to start the application.
require File.dirname(__FILE__) + '/config/boot.rb'
require 'initializers'
require 'app'

# log = File.new(“logs/sinatra.log”, “a”)
# STDOUT.reopen(log)
# STDERR.reopen(log)

# Set the AUTH env variable to your basic auth password to protect Resque.
Resque::Server.use(Rack::Auth::Basic) do |user, password|
  user == "developers@brightapps.in" && password == "blsjv2h8@"
end

run Rack::URLMap.new \
  "/" => Resque::Server.new(),
  "/ping" => Dashboard::App.new

