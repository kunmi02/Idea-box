module UsersHelper
  def destroy
    session.delete(:current_user_id)
  end
end
