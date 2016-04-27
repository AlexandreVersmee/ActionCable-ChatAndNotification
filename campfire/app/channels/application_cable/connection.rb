# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :cookie_user_id
    identified_by :cookie_user_name

    def connect
      self.cookie_user_id = cookies.signed[:user_id]
      self.cookie_user_name = User.find_by(id: cookies.signed[:user_id]).name
    end
  end
end