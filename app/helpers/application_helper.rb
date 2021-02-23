module ApplicationHelper
  def user_signed_in?
    puts '!!!!!!!!'
    puts session[:current_user_id]
    puts '************'
    return false unless session[:current_user_id]
  end
end


# user_signed_in?