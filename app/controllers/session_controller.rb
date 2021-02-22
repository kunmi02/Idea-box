class SessionController < ApplicationController
  def log_in
    @username = params[:username]
    @user = User.find_by(username: @username)
    if !@user.nil?
      flash[:notice] = 'Log in successful'
      session[:current_user_id] = @user.id
      session[:user_name] = @user.username
      redirect_to user_path(id: @user.id)
    else
      flash[:alert] = 'User not found.'
      redirect_to root_path
    end
  end

  def log_out
    session.delete(:current_user_id)
    flash[:alert] = 'You have successfully logged out'
    @_current_user = nil
    redirect_to root_path
  end

  def logged_in?
    return false unless session[:current_user_id]
  end

end
