class SessionController < ApplicationController
  def log_in
    @username = params[:username]
    @user = User.find_by(username: @username)
    if !@user.nil?
      flash[:notice] = 'Log in successful'
      session[:current_user_id] = @user.id
      session[:user_name] = @user.fullname
      redirect_to ideas_path
    else
      flash[:alert] = 'User not found.'
      redirect_to root_path
    end
  end

  def log_out
    session.delete(:current_user_id)
    flash[:alert] = 'You have successfully logged out'
    redirect_to root_path
  end

  def logged_in?
    return false unless session[:current_user_id]
  end
  helper_method :logged_in?
end
