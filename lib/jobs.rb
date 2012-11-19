require 'resque'
require 'resque-status'

# Placeholder for Urbanairship iOS device token migration job!
class UA_iOS_Migration 
  include Resque::Plugins::Status
  @queue = :migrations

  def perform(identifier,key,master_secret); end
end

# Placeholder for Urbanairship Android C2DM migration job!
class UA_Android_Migration 
  include Resque::Plugins::Status
  @queue = :migrations

  def perform(identifier,key,master_secret); end
end

class Schedule_APNS_PushNotifications
  include Resque::Plugins::Status
    @queue = :scheduler
   
   def perform; end 
end

class Process_APNS_PushNotifications
  include Resque::Plugins::Status
    @queue = :apns_notifier
   
   def perform; end 
end

class Schedule_C2DM_PushNotifications
  include Resque::Plugins::Status
    @queue = :scheduler
   
   def perform; end 
end

class Process_C2DM_PushNotifications
  include Resque::Plugins::Status
    @queue = :c2dm_notifier
   
   def perform; end 
end