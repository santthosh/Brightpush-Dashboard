set :branch, "develop"

role :web, "dashboard.brightpushalpha.in"                          # Your HTTP server, Apache/etc
role :app, "dashboard.brightpushalpha.in"                          # This may be the same as your `Web` server

ssh_options[:user] = "ubuntu"
ssh_options[:keys] = ["/data/ops/alpha/aws-keys/us-west-oregon/brightpush-dashboard.pem"]