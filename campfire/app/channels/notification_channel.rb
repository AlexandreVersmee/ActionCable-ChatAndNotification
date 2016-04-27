# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class NotificationChannel < ApplicationCable::Channel
    def subscribed
    stream_from "notification_channel#{cookie_user_id}"
    puts "[SERVER] Subscribed  notification_Channel#{cookie_user_id}"
  end

  def unsubscribed
    puts "[SERVER] Unsubscribed  notificationChannel"
  end
end
