set :branch, "release-0.01"

role :web, "dashboard.brightpushbeta.in"                          # Your HTTP server, Apache/etc
role :app, "dashboard.brightpushbeta.in"                          # This may be the same as your `Web` server

set :rack_env,"qa"

ssh_options[:user] = "ubuntu"
ssh_options[:keys] = ["/data/ops/alpha/aws-keys/us-west-oregon/brightpush-dashboard.pem"]