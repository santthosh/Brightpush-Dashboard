require 'resque'

# Placeholder for Urbanairship iOS device token migration job!
module UA_iOS_Migration 
  @queue = :migrations

  def self.perform(identifier,key,master_secret); end
end

# Placeholder for Urbanairship Android C2DM migration job!
module UA_Android_Migration 
  @queue = :migrations

  def self.perform(identifier,key,master_secret); end
end

module Schedule_APNS_PushNotifications
    @queue = :scheduler
   
   def self.perform; end 
end

module Process_APNS_PushNotifications
    @queue = :apns_notifier
   
   def self.perform; end 
end

module Schedule_C2DM_PushNotifications
    @queue = :scheduler
   
   def self.perform; end 
end