class ApplicationController < ActionController::Base
  include SessionsHelper

  def log_in(user)
    digest = user.create_remember_digest
    cookies.permanent[:user_id] = digest
    current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def sign_out
    @current_user = nil
    cookies.delete(:user_id)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in!"
    end
  end

end
