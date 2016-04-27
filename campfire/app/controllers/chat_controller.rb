class ChatController < ApplicationController

  def index
    if current_user
      @user = User.find(session[:user_id])
      @friends = @user.followers.paginate(page: params[:page])
    else
      flash[:danger] = "You must be logged in to access chatRoom"
      redirect_to root_url, notice: 'You are not logged in.'
    end
  end

end
