module ApplicationHelper
  def followers
    user = User.find(session[:current_user_id])
  end
end


# user_signed_in?