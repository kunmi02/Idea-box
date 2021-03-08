class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?
  helper_method :check_following
  def current_user
    User.find_by(id: session[:current_user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    false unless logged_in?
  end

  def check_following(follower_id, followed_id)
    @follower_id =follower_id
    @followed_id = followed_id
    @follow = Following.where(follower_id: @follower_id, followed_id: @followed_id)
    @reverse_follow = Following.where(follower_id: @followed_id, followed_id: @follower_id)
    if (@follow.empty?) && (@follow.empty?)
      return false
    else
      return true
    end
  end
end
