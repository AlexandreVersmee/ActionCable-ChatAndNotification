# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel#{cookie_user_id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    puts "data receive"
    ActionCable.server.broadcast "chat_channel#{data['id']}",
                                 message: data['message'],
                                 id: cookie_user_id,
                                 name: cookie_user_name
  end
end
