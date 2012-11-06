set :branch, "master"

role :web, "dashboard.brightpush.in"                          # Your HTTP server, Apache/etc
role :app, "dashboard.brightpush.in"                          # This may be the same as your `Web` server

set :rack_env,"production"

ssh_options[:user] = "ubuntu"
ssh_options[:keys] = ["/data/ops/alpha/aws-keys/us-west-oregon/brightpush-dashboard.pem"]