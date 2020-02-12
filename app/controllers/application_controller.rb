class ApplicationController < ActionController::Base
  def log_in(user)
    digest = user.create_remember_digest
    cookies.permanent[:user_id] = digest
    current_user = user
  end

  def current_user
    if user_id = cookies.signed[:user_id]
      @current_user ||= User.find_by(id: user_id)
    else
      nil
    end
  end

  def current_user=(user)
    @current_user = user
  end

  def sign_out
    @current_user = nil
    cookies.delete(:user_id)
  end
end
