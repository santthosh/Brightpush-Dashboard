require 'spec_helper'
require File.dirname(__FILE__) + '/../lib/jobs.rb'

describe "UA_iOS_Migration" do
  it "should perform migrations of iOS device tokens from Urban Airship to our system" do
    UA_iOS_Migration.method_defined?(:perform)
  end
end

describe "UA_Android_Migration" do
  it "should perform migrations of Android device tokens from Urban Airship to our system" do
    UA_Android_Migration.method_defined?(:perform)
  end
end

describe "Schedule_APNS_PushNotifications" do
  it "should schedule push notifications for iOS devices" do
    Schedule_APNS_PushNotifications.method_defined?(:perform)
  end
end

describe "Process_APNS_PushNotifications" do
  it "should process push notifications for iOS devices" do
    Process_APNS_PushNotifications.method_defined?(:perform)
  end
end

describe "Schedule_C2DM_PushNotifications" do
  it "should schedule c2dm notifications for Android devices" do
    Schedule_C2DM_PushNotifications.method_defined?(:perform)
  end
end

describe "Process_C2DM_PushNotifications" do
  it "should process push notifications for Android devices" do
    Process_APNS_PushNotifications.method_defined?(:perform)
  end
end