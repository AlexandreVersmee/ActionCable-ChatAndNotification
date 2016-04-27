class NotificationsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @notifs = Notification.where(user_id_to_notified: @user.id).order(:status)
    @notifs = @notifs.paginate(page: params[:page])
=begin

        @notifs.each do |notif|
        @users += User.find(notif.notified_id)
=end
  end

  def create
    render text: params.inspect
  end

  def update
    @notif = Notification.find(params[:notification][:id])
    @notif.update(status: 1)
    redirect_to notifications_url
  end

  def destroy
    Notification.find(params[:id]).destroy
    flash[:success] = "Notification deleted"
    redirect_to notifications_url
  end


end