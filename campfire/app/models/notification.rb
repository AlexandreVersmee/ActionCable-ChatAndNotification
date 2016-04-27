class Notification < ActiveRecord::Base
  after_create_commit { ActionCable.server.broadcast "notification_channel#{user_id_to_notified}" , notification: render_notification }

  after_commit{ ActionCable.server.broadcast "notif_counter_channel#{user_id_to_notified}", Notification.where(user_id_to_notified: user_id_to_notified, status: 0).count}

  private
  def render_notification
    ApplicationController.renderer.render(partial: 'notifications/notification', locals: { notif: self })
  end
end
