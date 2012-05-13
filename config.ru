$LOAD_PATH.unshift File.dirname(__FILE__) unless $LOAD_PATH.include?(File.dirname(__FILE__))

# This file is used by Rack-based servers to start the application.
require 'initializers'
require 'app'

# Set the AUTH env variable to your basic auth password to protect Resque.
Resque::Server.use(Rack::Auth::Basic) do |user, password|
  user == "developers@brightapps.in" && password == "blsjv2h8@"
end

run Rack::URLMap.new \
  "/" => Resque::Server.new(),
  "/ping" => Dashboard::App.new

