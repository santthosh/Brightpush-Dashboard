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

module Schedule_iOS_PushNotifications
    @queue = :scheduler
   
   def self.perform(identifier,key,master_secret); end 
end