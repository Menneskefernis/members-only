module SessionsHelper
  def logged_in?
    !current_user.nil?
  end

  def current_user
    if(user_id = cookies[:user_id])
      @current_user ||= User.find_by(id: user_id)
    else
      nil
    end
  end
  
end
