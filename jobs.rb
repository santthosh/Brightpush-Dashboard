require 'resque'
require 'resque-status'

# Placeholder for Urbanairship iOS device token migration job!
module UA_iOS_Migration 
  include Resque::Plugins::Status
  @queue = :migrations

  def self.perform(identifier,key,master_secret); end
end

# Placeholder for Urbanairship Android C2DM migration job!
module UA_Android_Migration 
  include Resque::Plugins::Status
  @queue = :migrations

  def self.perform(identifier,key,master_secret); end
end