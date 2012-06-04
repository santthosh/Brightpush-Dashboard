require 'sinatra/base'
require 'resque'
require 'lib/jobs'

module Dashboard
  class App < Sinatra::Base
    get '/' do
      info = Resque.info
      out = "<html><body>"
      out << "OK</body></html>"
      out
    end
  end
end