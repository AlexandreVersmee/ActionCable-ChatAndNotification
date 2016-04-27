# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class NotifCounterChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notif_counter_channel#{cookie_user_id}"
    puts "[SERVER] Subscribed  notif_counter_channel#{cookie_user_id}"
  end

  def unsubscribed
    puts "[SERVER] Unsubscribed  notif_counter_channel"
  end
end
