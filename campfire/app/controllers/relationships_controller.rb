class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find(params[:followed_id])

  # Insert notification to follow
    @content = "L'utilisateur #{current_user.name} (id: ##{current_user.id}) vous suit."
    @new_notification = Notification.new(:content => @content,
                                         :status => 0,
                                         :user_id_to_notified => @user.id,
                                         :notified_by => current_user.id)
    @new_notification.save
  # End

    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed

    # Insert notification to unfollow
      @content = "L'utilisateur #{current_user.name} (id: ##{current_user.id}) ne vous suit plus."
      @new_notification = Notification.new(:content => @content,
                                           :status => 0,
                                           :user_id_to_notified => @user.id,
                                           :notified_by => current_user.id)
      @new_notification.save
    # End

    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end
